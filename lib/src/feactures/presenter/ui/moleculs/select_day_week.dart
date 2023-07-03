import 'package:despertador/src/feactures/presenter/ui/atomic/container_day_week.dart';
import 'package:flutter/material.dart';

class SelectDayWeek extends StatefulWidget {
  final List<String> dayWeek;
  final List<String> listWeek;
  const SelectDayWeek(
      {super.key, required this.dayWeek, required this.listWeek});

  @override
  State<SelectDayWeek> createState() => _SelectDayWeekState();
}

class _SelectDayWeekState extends State<SelectDayWeek> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: ListView.builder(
        itemCount: widget.listWeek.length,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, idx) => InkWell(
          onTap: () {
            setState(() {
              widget.dayWeek.contains(widget.listWeek[idx])
                  ? widget.dayWeek.remove(widget.listWeek[idx])
                  : widget.dayWeek.add(widget.listWeek[idx]);
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Center(
              child: ContainerDayWeek(
                isSelect: widget.dayWeek.contains(
                  widget.listWeek[idx],
                ),
                text: widget.listWeek[idx].substring(0, 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
