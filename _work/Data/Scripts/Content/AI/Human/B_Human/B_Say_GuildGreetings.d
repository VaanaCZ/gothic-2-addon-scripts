// ********************
// B_Say_GuildGreetings
// ********************

func void B_Say_GuildGreetings (var C_NPC slf, var C_NPC oth)
{
	if (slf.guild == GIL_MIL)
	&& ( (oth.guild == GIL_MIL) || (oth.guild == GIL_PAL) )
	{
		B_Say_Overlay (slf, oth, "$MILGREETINGS");
		return;
	};
	
	if (slf.guild == GIL_PAL)
	&& ( (oth.guild == GIL_PAL) || (oth.guild == GIL_MIL) || (oth.guild == GIL_KDF) )
	{
		B_Say_Overlay (slf, oth, "$PALGREETINGS");
		return;
	};
	
	if (slf.guild == GIL_KDF)
	&& ( (oth.guild == GIL_PAL) || (oth.guild == GIL_NOV) || (oth.guild == GIL_KDF) )
	{
		B_Say_Overlay (slf, oth, "$PALGREETINGS");
		return;
	};
		
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Bartok))
	&& (Bartok_OrkGesagt == TRUE)
	{
		B_Bartok_ShitAnOrc(); //FIXME COSMETIC - sollte besser SVM_Overlay sein
		return;
	};
	
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Koch))
	{
		B_Koch_Hackebeil(); //FIXME COSMETIC - sollte besser SVM_Overlay sein
		return;
	};
		
	var int zufall; zufall = Hlp_Random (100); 
	
	if (zufall <= 10)
	&& Wld_IsRaining()
	{
		B_Say_Overlay (slf, oth, "$WEATHER"); //So ein Mistwetter!
		return;
		
	};
};


