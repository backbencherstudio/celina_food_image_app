class CheckboxModel {
  final bool isSelected;
  final bool isAllSelected;
  CheckboxModel({required this.isSelected, required this.isAllSelected});

  CheckboxModel copyWith({bool? isAllSelected, bool? isSelected}) {
    return CheckboxModel(
      isSelected: isSelected ?? this.isSelected,
      isAllSelected: isAllSelected ?? this.isAllSelected,
    );
  }
}
