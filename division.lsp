      int division(int a, int b) {
  if (b > a) {
    return 0; //no hay división posible
  } else {
    return 1 + division(a - b, b);
  }
}