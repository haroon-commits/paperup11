import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paperup1/modules/auth/presentation/state/auth_provider.dart';
import 'package:paperup1/core/theme/design_system.dart';
import 'package:paperup1/common_widgets/glass_container.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController(text: 'student@paperup.com');
  final _passwordController = TextEditingController(text: 'password');

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final design = Theme.of(context).design;

    return Scaffold(
      body: Stack(
        children: [
          // Primary Liquid Background
          Container(
            decoration: BoxDecoration(
              gradient: design.liquidGradient,
            ),
          ).animate().fadeIn(duration: 800.ms),
          
          // Organic Animated Glows
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                child: Container(color: Colors.transparent),
              ),
            ),
          ).animate(onPlay: (c) => c.repeat(reverse: true)).move(
            begin: const Offset(-20, -20),
            end: const Offset(20, 20),
            duration: 8.seconds,
          ),

          // Main Layout
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Brand Badge
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: Colors.white.withOpacity(0.2)),
                      ),
                      child: const Icon(Icons.school_rounded, color: Colors.white, size: 48),
                    ).animate().scale(curve: Curves.easeOutBack, duration: 600.ms),
                    
                    const SizedBox(height: 32),
                    Text(
                      'PaperUp.',
                      style: AppUIConfig.primaryFont.copyWith(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -1.5,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1, end: 0),
                    
                    Text(
                      'THE FUTURE OF SCHOOLING',
                      style: AppUIConfig.primaryFont.copyWith(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 4,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ).animate().fadeIn(delay: 400.ms),
                    
                    const SizedBox(height: 48),

                    // Immersive Glass Card
                    GlassContainer(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildModernField('STUDENT EMAIL', Icons.alternate_email_rounded, _emailController),
                          const SizedBox(height: 24),
                          _buildModernField('PASSWORD', Icons.lock_outline_rounded, _passwordController, isPassword: true),
                          const SizedBox(height: 40),
                          SizedBox(
                            width: double.infinity,
                            height: 64,
                            child: ElevatedButton(
                              onPressed: authState.isLoading ? null : () => _handleLogin(),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: design.primary,
                                elevation: 0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              ),
                              child: authState.isLoading
                                  ? CircularProgressIndicator(color: design.primary)
                                  : Text(
                                      'GET STARTED',
                                      style: AppUIConfig.primaryFont.copyWith(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1),
                                    ),
                            ),
                          ).animate().shimmer(delay: 1.seconds, duration: 2.seconds),
                        ],
                      ),
                    ).animate().fadeIn(delay: 600.ms).scale(begin: const Offset(0.98, 0.98)),

                    if (authState.error != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Text(
                          authState.error!,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ).animate().shake(),

                    const SizedBox(height: 60),
                    
                    // Role Quick Selection
                    Text(
                      'FAST ACCESS FOR DEMO',
                      style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2),
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _quickRoleChip('student'),
                          const SizedBox(width: 12),
                          _quickRoleChip('teacher'),
                          const SizedBox(width: 12),
                          _quickRoleChip('parent'),
                        ],
                      ),
                    ).animate().fadeIn(delay: 1.seconds),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModernField(String label, IconData icon, TextEditingController controller, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppUIConfig.primaryFont.copyWith(
            color: Colors.white.withOpacity(0.7),
            fontSize: 10,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            style: const TextStyle(color: Colors.white, fontSize: 16),
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Colors.white60, size: 22),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _quickRoleChip(String role) {
    return InkWell(
      onTap: () {
        _emailController.text = '$role@school.com';
        _passwordController.text = 'password';
        _handleLogin();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Text(
          role.toUpperCase(),
          style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void _handleLogin() {
    ref.read(authProvider.notifier).login(_emailController.text, _passwordController.text);
  }
}
