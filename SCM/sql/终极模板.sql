IF @A != NULL
  IF @B != NULL
    IF @C != NULL
       NULL
    ELSE --@C不空
      @C

  ELSE--B不空

    IF @C != NULL
       @B
    ELSE--C不空
      @B,@C

ELSE--A不空
  IF @B != NULL
    IF @C != NULL
       @A
    ELSE --@C不空
      @A,@C

  ELSE--B不空

    IF @C != NULL
       @A,@B
    ELSE--C不空
      @A,@B,@C

