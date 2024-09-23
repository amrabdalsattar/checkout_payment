part of '../payment_completion_screen.dart';

class Ticket extends StatelessWidget {
  const Ticket({super.key});

  @override
  Widget build(BuildContext context) {
    final double circlesBottomPosition =
        MediaQuery.sizeOf(context).width * 0.40;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        const PaymentCompletionCard(),
        Positioned(
          right: 0,
          left: 0,
          top: -50,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.ticketColor,
            child: CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.darkGreen,
              child: Padding(
                  padding: const EdgeInsets.all(13),
                  child: Image.asset(Images.check)),
            ),
          ),
        ),
        Positioned(
            left: -20,
            bottom: circlesBottomPosition,
            child: const CircleAvatar(
              backgroundColor: AppColors.white,
            )),
        Positioned(
            right: -20,
            bottom: circlesBottomPosition,
            child: const CircleAvatar(
              backgroundColor: AppColors.white,
            )),
        Positioned(
            bottom: circlesBottomPosition + 20,
            right: 0,
            left: 0,
            child: const DashedSeparator())
      ],
    );
  }
}
