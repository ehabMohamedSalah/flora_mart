void main() {
  List<int> twoSum(List<int> nums, int target) {
    Map<int, int> map = {}; // لحفظ: القيمة -> الفهرس
    for (int i = 0; i < nums.length; i++) {
      int complement = target - nums[i]; // الرقم الذي نحتاجه ليكمل المجموع
      print("complement: $target - ${nums[i]} = $complement");
      if (map.containsKey(complement)) {
        print("contains key true  ${map[complement]} ,${i}");
        return [map[complement]!, i]; // وجدنا الزوج: أرجع الفهرسين
      }
      map[nums[i]] = i; // خزّن الرقم الحالي مع فهرسه
      print(map);
    }

    return []; // لو ما لقيناش ولا زوج
  }

  print(twoSum([3, 2, 3], 6));
}
