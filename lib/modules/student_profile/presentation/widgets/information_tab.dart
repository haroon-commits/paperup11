import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paperup1/common_widgets/glass_container.dart';
import 'package:paperup1/core/theme/app_ui_config.dart';
import 'package:paperup1/modules/student_profile/presentation/state/student_profile_providers.dart';
import 'package:paperup1/core/theme/responsive_utils.dart';

class InformationTab extends ConsumerWidget {
  const InformationTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentInfoAsync = ref.watch(studentInfoProvider);

    return studentInfoAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
      data: (info) => SingleChildScrollView(
        padding: AppUIConfig.components.pagePadding,
        child: Column(
          children: [
            _buildSection(
              title: 'Personal Details',
              icon: Icons.person_outline,
              children: [
                _buildInfoRow(Icons.person, 'Full Name', info.fullName),
                _buildInfoRow(Icons.calendar_today, 'Date of Birth', info.dateOfBirth),
                _buildInfoRow(Icons.email_outlined, 'Email', info.email),
                _buildInfoRow(Icons.phone_outlined, 'Phone', info.phone),
              ],
            ),
            SizedBox(height: AppUIConfig.metrics.spacingLarge),
            _buildSection(
              title: 'Academic Information',
              icon: Icons.school_outlined,
              children: [
                _buildInfoRow(Icons.badge_outlined, 'Roll Number', info.rollNumber ?? 'N/A'),
                _buildInfoRow(Icons.class_outlined, 'Class ID', info.classId ?? 'N/A'),
                _buildInfoRow(Icons.hub_outlined, 'Section ID', info.sectionId ?? 'N/A'),
                _buildInfoRow(Icons.calendar_month_outlined, 'Admission Date', info.admissionDate ?? '—'),
              ],
            ),
            SizedBox(height: AppUIConfig.metrics.spacingLarge),
            _buildSection(
              title: 'Other Details',
              icon: Icons.home_outlined,
              children: [
                _buildInfoRow(Icons.supervisor_account_outlined, 'Parent ID', info.parentId?.toString() ?? 'N/A'),
                _buildInfoRow(Icons.bloodtype_outlined, 'Blood Group', info.bloodGroup ?? 'N/A'),
              ],
            ),
            // Bottom spacing
            SizedBox(height: 80.s),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return GlassContainer(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppUIConfig.colors.info, size: 20.s),
              SizedBox(width: AppUIConfig.metrics.spacingSmall),
              Text(
                title,
                style: AppUIConfig.text.heading3.copyWith(fontSize: 18.s),
              ),
            ],
          ),
          SizedBox(height: AppUIConfig.metrics.spacingLarge),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = constraints.maxWidth > 900 ? 4 : (constraints.maxWidth > 600 ? 3 : 2);
              
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: children.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: AppUIConfig.metrics.spacingLarge,
                  mainAxisSpacing: AppUIConfig.metrics.spacingLarge,
                  mainAxisExtent: 70.s, // Scaled for safe wrapping of labels + values
                ),
                itemBuilder: (context, index) => children[index],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Icon(icon, size: 14.s, color: AppUIConfig.colors.textMuted),
            SizedBox(width: 4.s),
            Expanded(
              child: Text(
                label,
                style: AppUIConfig.text.caption.copyWith(
                  color: AppUIConfig.colors.textMuted,
                  letterSpacing: 0.5,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        SizedBox(height: 2.s),
        Text(
          value,
          style: AppUIConfig.text.bodyBright.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 14.s, // Scaled for safe wrapping
          ),
          softWrap: true,
          maxLines: 2,
          overflow: TextOverflow.visible,
        ),
      ],
    );
  }
}
