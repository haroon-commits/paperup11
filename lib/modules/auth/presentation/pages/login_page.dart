import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
                color: AppUIConfig.colors.white.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                child: Container(color: AppUIConfig.colors.transparent),
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
                      padding: EdgeInsets.all(AppUIConfig.metrics.paddingDefault),
                      decoration: BoxDecoration(
                        color: AppUIConfig.colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(color: AppUIConfig.colors.white.withOpacity(0.2)),
                      ),
                      child: Icon(Icons.school_rounded, color: AppUIConfig.colors.white, size: 48),
                    ).animate().scale(curve: Curves.easeOutBack, duration: 600.ms),
                    
                    SizedBox(height: AppUIConfig.metrics.spacingExtraLarge),
                    Text(
                      AppUIConfig.strings.appName,
                      style: AppUIConfig.text.heading1.copyWith(
                        fontSize: 42,
                        letterSpacing: -1.5,
                        shadows: [
                          Shadow(
                            color: AppUIConfig.colors.shadowDark,
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1, end: 0),
                    
                    Text(
                      AppUIConfig.strings.loginSubtitle,
                      style: AppUIConfig.text.caption.copyWith(
                        color: AppUIConfig.colors.white.withOpacity(0.8),
                        fontSize: 12,
                        letterSpacing: 4,
                        shadows: [
                          Shadow(
                            color: AppUIConfig.colors.shadowDark,
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
                          _buildModernField(AppUIConfig.strings.studentEmailLabel, Icons.alternate_email_rounded, _emailController),
                          SizedBox(height: AppUIConfig.metrics.spacingLarge),
                          _buildModernField(AppUIConfig.strings.passwordLabel, Icons.lock_outline_rounded, _passwordController, isPassword: true),
                          const SizedBox(height: 40),
                          SizedBox(
                            width: double.infinity,
                            height: 64,
                            child: ElevatedButton(
                              onPressed: authState.isLoading ? null : () => _handleLogin(),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppUIConfig.colors.white,
                                foregroundColor: design.primary,
                                elevation: 0,
                                shape: RoundedRectangleBorder(borderRadius: AppUIConfig.components.inputRadius),
                              ),
                              child: authState.isLoading
                                  ? CircularProgressIndicator(color: design.primary)
                                  : Text(
                                      AppUIConfig.strings.getStartedButton,
                                      style: AppUIConfig.text.button.copyWith(color: design.primary, letterSpacing: 1),
                                    ),
                            ),
                          ).animate().shimmer(delay: 1.seconds, duration: 2.seconds),
                        ],
                      ),
                    ).animate().fadeIn(delay: 600.ms).scale(begin: const Offset(0.98, 0.98)),

                    if (authState.error != null)
                      Padding(
                        padding: EdgeInsets.only(top: AppUIConfig.metrics.paddingLarge),
                        child: Text(
                          authState.error!,
                          style: AppUIConfig.text.bodySemiBold,
                        ),
                      ).animate().shake(),

                    const SizedBox(height: 60),
                    
                    // Role Quick Selection
                    Text(
                      AppUIConfig.strings.fastAccessDemo,
                      style: AppUIConfig.text.caption.copyWith(
                        color: AppUIConfig.colors.textLight, 
                        fontSize: 10, 
                        letterSpacing: 2
                      ),
                    ),
                    SizedBox(height: AppUIConfig.metrics.spacingDefault),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _quickRoleChip('student'),
                          SizedBox(width: AppUIConfig.metrics.spacingSmall),
                          _quickRoleChip('teacher'),
                          SizedBox(width: AppUIConfig.metrics.spacingSmall),
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
          style: AppUIConfig.text.caption.copyWith(
            color: AppUIConfig.colors.white.withOpacity(0.7),
            fontSize: 10,
            letterSpacing: 2,
          ),
        ),
        SizedBox(height: AppUIConfig.metrics.spacingSmall),
        Container(
          decoration: BoxDecoration(
            color: AppUIConfig.colors.white.withOpacity(0.05),
            borderRadius: AppUIConfig.components.inputRadius,
            border: Border.all(color: AppUIConfig.colors.white.withOpacity(0.1)),
          ),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            style: AppUIConfig.text.bodyBright.copyWith(fontSize: 16),
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
          color: AppUIConfig.colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppUIConfig.colors.white.withOpacity(0.2)),
        ),
        child: Text(
          role.toUpperCase(),
          style: AppUIConfig.text.chip.copyWith(
            color: AppUIConfig.colors.white, 
            fontSize: 11
          ),
        ),
      ),
    );
  }

  void _handleLogin() {
    ref.read(authProvider.notifier).login(_emailController.text, _passwordController.text);
  }
}
