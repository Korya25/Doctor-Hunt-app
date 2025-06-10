import 'package:doctor_hunt/core/constant/app_colors.dart';
import 'package:doctor_hunt/core/constant/app_string.dart';
import 'package:doctor_hunt/core/constant/app_values.dart';
import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:doctor_hunt/core/widgets/background_scaffold.dart';
import 'package:doctor_hunt/core/widgets/custom_horizontal_list_view.dart';
import 'package:doctor_hunt/features/home/data/models/doctor_model.dart';
import 'package:doctor_hunt/features/home/data/test_data/doctor_data.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/select_me_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectMeView extends StatelessWidget {
  const SelectMeView({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.paddingH20V20,
          child: Column(
            spacing: 18.h,
            children: [
              CustomAppBar(title: AppString.selectMe),
              Expanded(
                child: SingleChildScrollView(
                  child: SelectMeViewBody(doctor: doctor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectMeViewBody extends StatefulWidget {
  const SelectMeViewBody({super.key, required this.doctor});
  final DoctorModel doctor;

  @override
  State<SelectMeViewBody> createState() => _SelectMeViewBodyState();
}

class _SelectMeViewBodyState extends State<SelectMeViewBody> {
  int selectedDateTab = 1;
  String selectedTime = '2:00 PM';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectMeCard(doctor: widget.doctor),
        CustomHorizontalListView(
          height: 80.h,
          itemCount: DoctorData.dateTabs.length,
          itemBuilder: (context, index) {
            return DateTab(
              date: DoctorData.dateTabs[index],
              slotsAvailable: _getSlotsAvailableText(index),
              isSelected: selectedDateTab == index,
              onTap: () => setState(() => selectedDateTab = index),
            );
          },
        ),

        SizedBox(height: 16.h),
        Text(
          DoctorData.dateTabs[selectedDateTab],
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        _buildTimeSlotsSections(),
      ],
    );
  }

  Widget _buildTimeSlotsSections() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTimeSlotSection('Afternoon 7 slots', DoctorData.afternoonSlots),
        _buildTimeSlotSection('Evening 5 slots', DoctorData.eveningSlots),
      ],
    );
  }

  Widget _buildTimeSlotSection(String title, List<String> slots) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12.h),
        Text(title, style: TextStyle(color: AppColors.secondaryColor)),
        SizedBox(height: 8.h),
        _buildTimeGrid(slots),
      ],
    );
  }

  Widget _buildTimeGrid(List<String> slots) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: constraints.maxWidth ~/ 100,
            childAspectRatio: 2.5,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          itemCount: slots.length,
          itemBuilder: (context, index) => TimeSlot(
            time: slots[index],
            isSelected: slots[index] == selectedTime,
            onTap: () => setState(() => selectedTime = slots[index]),
          ),
        );
      },
    );
  }

  String _getSlotsAvailableText(int index) {
    switch (index) {
      case 0:
        return 'No slots available';
      case 1:
        return '9 slots available';
      case 2:
        return '10 slots available';
      default:
        return '';
    }
  }
}

class TimeSlotGrid extends StatelessWidget {
  final List<String> slots;
  final String selectedTime;
  final ValueChanged<String> onTimeSelected;

  const TimeSlotGrid({
    super.key,
    required this.slots,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: slots
          .map(
            (slot) => TimeSlot(
              time: slot,
              isSelected: slot == selectedTime,
              onTap: () => onTimeSelected(slot),
            ),
          )
          .toList(),
    );
  }
}

class TimeSlot extends StatelessWidget {
  final String time;
  final bool isSelected;
  final VoidCallback onTap;

  const TimeSlot({
    super.key,
    required this.time,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        padding: const EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryColor
                : AppColors.secondaryColor,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: AppColors.primaryColor.withOpacity(0.2),
                blurRadius: 4,
              ),
          ],
        ),
        child: Text(
          time,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class DateTab extends StatelessWidget {
  final String date;
  final String slotsAvailable;
  final bool isSelected;
  final VoidCallback onTap;

  const DateTab({
    super.key,
    required this.date,
    required this.slotsAvailable,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryColor
                : AppColors.secondaryColor,
          ),
        ),
        child: Column(
          children: [
            Text(
              date,
              style: AppTextStyles.rubik15MediumPrimary.copyWith(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            Text(
              slotsAvailable,
              style: TextStyle(
                color: isSelected ? Colors.white70 : Colors.grey,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
