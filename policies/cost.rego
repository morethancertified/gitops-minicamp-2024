package infracost 

deny[out] {
  # maxDiff defines the threshold that you require the cost estimate to be below
  maxDiff = 10.0

  msg := sprintf(
    "Total monthly cost diff must be less than $%.2f (actual diff is $%.2f)",
    [maxDiff, to_number(input.diffTotalMonthlyCost)],
  )

  out := {
    # the msg you want to display in your PR comment, must be a string
    "msg": msg,
    "failed": to_number(input.diffTotalMonthlyCost) >= maxDiff
  }
}