import 'package:flutter/material.dart';

class FilterTile extends StatefulWidget {
  FilterTile({
    super.key,
    required this.value,
    required this.onChangedFunc,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;
  final bool value;
  final void Function(bool) onChangedFunc;

  @override
  State<FilterTile> createState() {
    return _FilterTileState();
  }
}

class _FilterTileState extends State<FilterTile> {
  @override
  Widget build(context) {
    return SwitchListTile(
      value: widget.value,
      onChanged: (isChecked) {
        widget.onChangedFunc(isChecked);
      },
      title: Text(
        widget.title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        widget.subtitle,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
