// ********************************************************************
// C_NpcBelongsTo -
// ----------------
// - OldCamp
// - City
// - Monastery
// - Farm
// Checks werden vor allem von Crime/News/Absolution - System verwendet
// ********************************************************************

func int C_NpcBelongsToOldCamp (var C_NPC slf)
{
	if (slf.npctype == NPCTYPE_OCMAIN)
	|| (slf.npctype == NPCTYPE_OCAMBIENT)
	{
		if (slf.guild == GIL_VLK)
		|| (slf.guild == GIL_MIL)
		|| (slf.guild == GIL_PAL)
		{
			return TRUE;
		};
	};
	
	return FALSE;
};

// ---------------------------------------------------------------------

func int C_NpcBelongsToCity (var C_NPC slf)
{
	if (! C_NpcBelongsToOldCamp (slf))
	{
		if (slf.guild == GIL_VLK)
		|| (slf.guild == GIL_MIL)
		|| (slf.guild == GIL_PAL)
		{
			return TRUE;
		};
	};
	
	return FALSE;
};

// ---------------------------------------------------------------------

func int C_NpcBelongsToMonastery (var C_NPC slf)
{
	if (slf.guild == GIL_KDF)
	|| (slf.guild == GIL_NOV)
	{
		return TRUE;
	};
	
	return FALSE;
};

// ---------------------------------------------------------------------

func int C_NpcBelongsToFarm (var C_NPC slf)
{
	if (slf.guild == GIL_BAU)
	|| (slf.guild == GIL_SLD)
	{
		return TRUE;
	};
	
	return FALSE;
};
// ---------------------------------------------------------------------

func int C_NpcBelongsToBL (var C_NPC slf)
{
	if (slf.npctype == NPCTYPE_BL_AMBIENT)
	|| (slf.npctype == NPCTYPE_BL_MAIN)
	{
		return TRUE;
	};
	
	return FALSE;
};
