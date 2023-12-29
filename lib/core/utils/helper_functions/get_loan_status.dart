

getLoanStatus(int loanStatus){
  if(loanStatus == 1){
    return "Active";
  }else if(loanStatus == 2){
    return "Pending";
  }else if(loanStatus == 3){
    return "Inactive";
  }else if(loanStatus == 4){
    return "Cancelled";
  }else if(loanStatus == 5){
    return "Delayed";
  }else if(loanStatus == 6){
    return "Paid";
  }else
    return "None";
}