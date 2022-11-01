func void B_FollowMe_Wisp ()
{
	AI_Output		(other, self, "DIA_Addon_WispDetector_FollowMe_Wisp_15_00"); //Sígueme.
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

	description	 = 	"¡Encuentra algo para mí!";
};

func int DIA_Addon_WispDetector_DetectItems_Condition ()
{
	return TRUE;
};

func void DIA_Addon_WispDetector_DetectItems_Info ()
{
	AI_Output	(other, self, "DIA_Addon_WispDetector_DetectItems_15_00"); //¡Encuentra algo para mí!

	Info_ClearChoices	(DIA_Addon_WispDetector_DetectItems);

	Info_AddChoice	(DIA_Addon_WispDetector_DetectItems, "Sígueme.", DIA_Addon_WispDetector_DetectItems_Follow );

	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] 	== TRUE)	
	{	
		Info_AddChoice	(DIA_Addon_WispDetector_DetectItems, "Necesito runas y pergaminos."						, DIA_Addon_WispDetector_DetectItems_RUNE );
	};
	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] 	== TRUE)		
	{	
		Info_AddChoice	(DIA_Addon_WispDetector_DetectItems, "Necesito oro, llaves y utensilios."		, DIA_Addon_WispDetector_DetectItems_NONE );
	};
	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] 	== TRUE)		
	{	
		Info_AddChoice	(DIA_Addon_WispDetector_DetectItems, "Necesito armas de largo alcance y munición."				, DIA_Addon_WispDetector_DetectItems_FF );
	};
	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] 	== TRUE)		
	{	
		Info_AddChoice	(DIA_Addon_WispDetector_DetectItems, "Necesito armas de cuerpo a cuerpo."								, DIA_Addon_WispDetector_DetectItems_NF );
	};
	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] 	== TRUE)		
	{	
		Info_AddChoice	(DIA_Addon_WispDetector_DetectItems, "Necesito comida y plantas."							, DIA_Addon_WispDetector_DetectItems_FOOD );
	};
	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == TRUE)	
	{	
		Info_AddChoice	(DIA_Addon_WispDetector_DetectItems, "Necesito anillos y amuletos."							, DIA_Addon_WispDetector_DetectItems_MAGIC );
	};
	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == TRUE)	
	{	
		Info_AddChoice	(DIA_Addon_WispDetector_DetectItems, "Necesito todo tipo de pociones."							, DIA_Addon_WispDetector_DetectItems_POTIONS );
	};

	Info_AddChoice	(DIA_Addon_WispDetector_DetectItems, "Busca, lo que puedas, todo lo que encuentres."				, DIA_Addon_WispDetector_DetectItems_ALL );
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
	AI_Output			(other, self, "DIA_Addon_WispDetector_DetectItems_ALL_15_00"); //¡Dame lo que encuentres!
	WispSearching = WispSearch_ALL;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

func void DIA_Addon_WispDetector_DetectItems_POTIONS ()
{
	AI_Output			(other, self, "DIA_Addon_WispDetector_DetectItems_POTIONS_15_00"); //Necesito todo tipo de pociones.
	WispSearching = WispSearch_POTIONS;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

func void DIA_Addon_WispDetector_DetectItems_MAGIC ()
{
	AI_Output			(other, self, "DIA_Addon_WispDetector_DetectItems_MAGIC_15_00"); //Necesito anillos y amuletos.
	WispSearching = WispSearch_MAGIC;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

func void DIA_Addon_WispDetector_DetectItems_FOOD ()
{
	AI_Output			(other, self, "DIA_Addon_WispDetector_DetectItems_FOOD_15_00"); //Necesito comida y plantas.
	WispSearching = WispSearch_FOOD;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

func void DIA_Addon_WispDetector_DetectItems_NF ()
{
	AI_Output			(other, self, "DIA_Addon_WispDetector_DetectItems_NF_15_00"); //Necesito armas de cuerpo a cuerpo.
	WispSearching = WispSearch_NF;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

func void DIA_Addon_WispDetector_DetectItems_FF ()
{
	AI_Output			(other, self, "DIA_Addon_WispDetector_DetectItems_FF_15_00"); //Necesito armas de largo alcance y munición.
	WispSearching = WispSearch_FF;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

func void DIA_Addon_WispDetector_DetectItems_NONE ()
{
	AI_Output			(other, self, "DIA_Addon_WispDetector_DetectItems_NONE_15_00"); //Necesito oro, llaves y utensilios.
	WispSearching = WispSearch_NONE;
	B_IrrlichtBeep();
	AI_StopProcessInfos (self);
};

func void DIA_Addon_WispDetector_DetectItems_RUNE ()
{
	AI_Output			(other, self, "DIA_Addon_WispDetector_DetectItems_RUNE_15_00"); //Necesito runas y pergaminos.
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

	description	 = 	"Sígueme.";
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





