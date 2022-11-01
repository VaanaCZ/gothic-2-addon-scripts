func void B_FollowMe_Wisp ()
{
	AI_Output		(other, self, "DIA_Addon_WispDetector_FollowMe_Wisp_15_00"); //Chodź za mną!
};
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_WispDetector_EXIT   (C_INFO)
{
	npc         = Wisp_Detector;
	nr          = 999;
	condition   = DIA_Addon_WispDetector_EXIT_Condition;
	information = DIA_Addon_WispDetector_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_WispDetector_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_WispDetector_EXIT_Info()
{
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info DetectItems
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_WispDetector_DetectItems		(C_INFO)
{
	npc		 = 	Wisp_Detector;
	nr		 = 	5;
	condition	 = 	DIA_Addon_WispDetector_DetectItems_Condition;
	information	 = 	DIA_Addon_WispDetector_DetectItems_Info;
	permanent	 = 	TRUE;

	description	 = 	"Poszukaj czegoś!";
};

func int DIA_Addon_WispDetector_DetectItems_Condition ()
{
	return TRUE;
};

func void DIA_Addon_WispDetector_DetectItems_Info ()
{
	AI_Output	(other, self, "DIA_Addon_WispDetector_DetectItems_15_00"); //Poszukaj czegoś!

	Info_ClearChoices	(DIA_Addon_WispDetector_DetectItems);

	Info_AddChoice	(DIA_Addon_WispDetector_DetectItems, "Chodź za mną!", DIA_Addon_WispDetector_DetectItems_Follow );

	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] 	== TRUE)	
	{	
		Info_AddChoice	(DIA_Addon_WispDetector_DetectItems, "Potrzebuję run i zwojów magicznych."						, DIA_Addon_WispDetector_DetectItems_RUNE );
	};
	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] 	== TRUE)		
	{	
		Info_AddChoice	(DIA_Addon_WispDetector_DetectItems, "Potrzebuję złota, kluczy i narzędzi."		, DIA_Addon_WispDetector_DetectItems_NONE );
	};
	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] 	== TRUE)		
	{	
		Info_AddChoice	(DIA_Addon_WispDetector_DetectItems, "Potrzebuję broni strzeleckiej i amunicji."				, DIA_Addon_WispDetector_DetectItems_FF );
	};
	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] 	== TRUE)		
	{	
		Info_AddChoice	(DIA_Addon_WispDetector_DetectItems, "Potrzebuję broni do walki wręcz."								, DIA_Addon_WispDetector_DetectItems_NF );
	};
	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] 	== TRUE)		
	{	
		Info_AddChoice	(DIA_Addon_WispDetector_DetectItems, "Potrzebuję żywności i ziół."							, DIA_Addon_WispDetector_DetectItems_FOOD );
	};
	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == TRUE)	
	{	
		Info_AddChoice	(DIA_Addon_WispDetector_DetectItems, "Potrzebuję pierścieni i amuletów."							, DIA_Addon_WispDetector_DetectItems_MAGIC );
	};
	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == TRUE)	
	{	
		Info_AddChoice	(DIA_Addon_WispDetector_DetectItems, "Potrzebuję magicznych mikstur."							, DIA_Addon_WispDetector_DetectItems_POTIONS );
	};

	Info_AddChoice	(DIA_Addon_WispDetector_DetectItems, "Poszukaj wszystkiego, co znajdziesz."				, DIA_Addon_WispDetector_DetectItems_ALL );
};

func void DIA_Addon_WispDetector_DetectItems_Follow ()
{
	B_FollowMe_Wisp ();
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
	WispSearching = WispSearch_Follow;
};

func void DIA_Addon_WispDetector_DetectItems_ALL ()
{
	AI_Output			(other, self, "DIA_Addon_WispDetector_DetectItems_ALL_15_00"); //Poszukaj wszystkiego, co znajdziesz.
	WispSearching = WispSearch_ALL;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

func void DIA_Addon_WispDetector_DetectItems_POTIONS ()
{
	AI_Output			(other, self, "DIA_Addon_WispDetector_DetectItems_POTIONS_15_00"); //Potrzebuję magicznych mikstur.
	WispSearching = WispSearch_POTIONS;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

func void DIA_Addon_WispDetector_DetectItems_MAGIC ()
{
	AI_Output			(other, self, "DIA_Addon_WispDetector_DetectItems_MAGIC_15_00"); //Potrzebuję pierścieni i amuletów.
	WispSearching = WispSearch_MAGIC;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

func void DIA_Addon_WispDetector_DetectItems_FOOD ()
{
	AI_Output			(other, self, "DIA_Addon_WispDetector_DetectItems_FOOD_15_00"); //Potrzebuję żywności i ziół.
	WispSearching = WispSearch_FOOD;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

func void DIA_Addon_WispDetector_DetectItems_NF ()
{
	AI_Output			(other, self, "DIA_Addon_WispDetector_DetectItems_NF_15_00"); //Potrzebuję broni do walki wręcz.
	WispSearching = WispSearch_NF;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

func void DIA_Addon_WispDetector_DetectItems_FF ()
{
	AI_Output			(other, self, "DIA_Addon_WispDetector_DetectItems_FF_15_00"); //Potrzebuję broni strzeleckiej i amunicji.
	WispSearching = WispSearch_FF;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

func void DIA_Addon_WispDetector_DetectItems_NONE ()
{
	AI_Output			(other, self, "DIA_Addon_WispDetector_DetectItems_NONE_15_00"); //Potrzebuję złota, kluczy i innych przedmiotów.
	WispSearching = WispSearch_NONE;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

func void DIA_Addon_WispDetector_DetectItems_RUNE ()
{
	AI_Output			(other, self, "DIA_Addon_WispDetector_DetectItems_RUNE_15_00"); //Potrzebuję run i zwojów magicznych.
	WispSearching = WispSearch_RUNE;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Follow
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_WispDetector_Follow		(C_INFO)
{
	npc		 = 	Wisp_Detector;
	nr		 = 	5;
	condition	 = 	DIA_Addon_WispDetector_Follow_Condition;
	information	 = 	DIA_Addon_WispDetector_Follow_Info;
	permanent	 = 	TRUE;

	description	 = 	"Chodź za mną!";
};

func int DIA_Addon_WispDetector_Follow_Condition ()
{
	return TRUE;
};

func void DIA_Addon_WispDetector_Follow_Info ()
{
	B_FollowMe_Wisp ();
	WispSearching = WispSearch_Follow;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};





