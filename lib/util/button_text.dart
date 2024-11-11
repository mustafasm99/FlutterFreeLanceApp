String getButtonText (int step){
  switch(step){
    case 1:
      return "Send verification code";
    case 2:
      return "Verify";
    case 3:
      return "Complete registration";
  }
  return "Next";
}