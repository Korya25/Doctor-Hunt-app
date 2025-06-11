import 'package:doctor_hunt/core/resources/app_text_styles.dart';
import 'package:doctor_hunt/features/home/data/test_data/doctor_data.dart';
import 'package:doctor_hunt/features/home/presentation/widgets/time_slot_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeSlotsSections extends StatelessWidget {
  final String selectedTime;
  final ValueChanged<String> onTimeSelected;

  const TimeSlotsSections({
    super.key,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTimeSlotSection(
          title: 'Afternoon 7 slots',
          slots: DoctorData.afternoonSlots,
          selectedTime: selectedTime,
          onTimeSelected: onTimeSelected,
        ),
        buildTimeSlotSection(
          title: 'Evening 5 slots',
          slots: DoctorData.eveningSlots,
          selectedTime: selectedTime,
          onTimeSelected: onTimeSelected,
        ),
      ],
    );
  }

  Widget buildTimeSlotSection({
    required String title,
    required List<String> slots,
    required String selectedTime,
    required ValueChanged<String> onTimeSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12.h),
        Text(title, style: AppTextStyles.rubik16MediumPrimary),
        SizedBox(height: 8.h),
        TimeSlotGrid(
          slots: slots,
          selectedTime: selectedTime,
          onTimeSelected: onTimeSelected,
        ),
      ],
    );
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
          itemBuilder: (context, index) {
            return TimeSlotCard(
              time: slots[index],
              isSelected: slots[index] == selectedTime,
              onTap: () => onTimeSelected(slots[index]),
            );
          },
        );
      },
    );
  }
}
