String phoneFormatToShow(String phone) {
  if (phone.length >= 4 && phone.length <= 7) {
    phone = '${phone.substring(0, 3)} ${phone.substring(3, phone.length)}';
  } else if (phone.length > 7) {
    phone =
        '${phone.substring(0, 3)} ${phone.substring(3, 7)} ${phone.substring(7, phone.length)}';
  }
  return phone;
}