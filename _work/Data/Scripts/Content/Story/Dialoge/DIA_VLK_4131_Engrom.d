///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Engrom_EXIT   (C_INFO)
{
	npc         = VLK_4131_Engrom;
	nr          = 999;
	condition   = DIA_Engrom_EXIT_Condition;
	information = DIA_Engrom_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Engrom_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Engrom_EXIT_Info()
{
	B_NpcClearObsessionByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Engrom_HALLO		(C_INFO)
{
	npc		 = 	VLK_4131_Engrom;
	nr          = 5;
	condition	 = 	DIA_Engrom_HALLO_Condition;
	information	 = 	DIA_Engrom_HALLO_Info;

	description	 = 	"Co s³ychaæ?";
};

func int DIA_Engrom_HALLO_Condition ()
{
	if (Kapitel <= 3)
		{
				return TRUE;
		};
};

func void DIA_Engrom_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Engrom_HALLO_15_00"); //Jak leci?
	AI_Output			(self, other, "DIA_Engrom_HALLO_12_01"); //Fatalnie!
	AI_Output			(other, self, "DIA_Engrom_HALLO_15_02"); //Mmmh!
	AI_Output			(self, other, "DIA_Engrom_HALLO_12_03"); //Co jeszcze mogê powiedzieæ. Ca³ymi dniami tylko w górê i w dó³ tej cholernej rzeki.
	AI_Output			(self, other, "DIA_Engrom_HALLO_12_04"); //Orkowie po lewej, bandyci po prawej... I ci¹gle tylko to miêso topielców. Trudno to wytrzymaæ na d³u¿sz¹ metê.
};

///////////////////////////////////////////////////////////////////////
//	Info WhatAboutLeaving
///////////////////////////////////////////////////////////////////////
instance DIA_Engrom_WhatAboutLeaving		(C_INFO)
{
	npc		 = 	VLK_4131_Engrom;
	nr          = 6;
	condition	 = 	DIA_Engrom_WhatAboutLeaving_Condition;
	information	 = 	DIA_Engrom_WhatAboutLeaving_Info;

	description	 = 	"Zastanawia³eœ siê kiedyœ nad opuszczeniem tego miejsca?";
};

func int DIA_Engrom_WhatAboutLeaving_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Engrom_HALLO))
	&& (Kapitel <= 3)
		{
				return TRUE;
		};
};

func void DIA_Engrom_WhatAboutLeaving_Info ()
{
	AI_Output			(other, self, "DIA_Engrom_WhatAboutLeaving_15_00"); //Zastanawia³eœ siê kiedyœ nad opuszczeniem tego miejsca?
	AI_Output			(self, other, "DIA_Engrom_WhatAboutLeaving_12_01"); //Tak, pewnie. Nie ma problemu.
	AI_Output			(self, other, "DIA_Engrom_WhatAboutLeaving_12_02"); //Najpierw przedrê siê przez hordy orków, powiem 'dzieñ dobry' potworom kr¹¿¹cym po ca³ej okolicy, a potem spacerkiem przejdê sobie przez prze³êcz!
	AI_Output			(self, other, "DIA_Engrom_WhatAboutLeaving_12_03"); //To by by³a niez³a sztuczka!
	AI_Output			(other, self, "DIA_Engrom_WhatAboutLeaving_15_04"); //Ale ja jakoœ siê tu przedosta³em.
	AI_Output			(self, other, "DIA_Engrom_WhatAboutLeaving_12_05"); //Czy chcesz mi powiedzieæ, ¿e w³aœnie przekroczy³eœ prze³êcz?
	AI_Output			(other, self, "DIA_Engrom_WhatAboutLeaving_15_06"); //Jak widaæ - tak!
	AI_Output			(self, other, "DIA_Engrom_WhatAboutLeaving_12_07"); //Mia³eœ szczêœcie. Jeœli o mnie chodzi, to dopóki w okolicy trochê siê nie uspokoi, nie zamierzam siê w ogóle st¹d ruszaæ.

};

///////////////////////////////////////////////////////////////////////
//	Info Jagd
///////////////////////////////////////////////////////////////////////
instance DIA_Engrom_Jagd		(C_INFO)
{
	npc		 = 	VLK_4131_Engrom;
	nr          = 6;
	condition	 = 	DIA_Engrom_Jagd_Condition;
	information	 = 	DIA_Engrom_Jagd_Info;
	permanent	 = 	TRUE;

	description	 = 	"Jak idzie polowanie?";
};

func int DIA_Engrom_Jagd_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Engrom_HALLO))
	&& (Kapitel <= 3)
		{
				return TRUE;
		};
};

func void DIA_Engrom_Jagd_Info ()
{
	B_WasMachtJagd ();
	//Joly:AI_Output			(other, self, "DIA_Engrom_Jagd_15_00"); //Schon mal dran gedacht, hier abzuhauen?
	AI_Output			(self, other, "DIA_Engrom_Jagd_12_01"); //Polowanie jest moj¹ jedyn¹ pociech¹. Przyda³by siê od czasu do czasu jakiœ inny cel ni¿ te przeklête topielce.
};

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Engrom_KAP3_EXIT(C_INFO)
{
	npc			= VLK_4131_Engrom;
	nr			= 999;
	condition	= DIA_Engrom_KAP3_EXIT_Condition;
	information	= DIA_Engrom_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Engrom_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Engrom_KAP3_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Engrom_KAP4_EXIT(C_INFO)
{
	npc			= VLK_4131_Engrom;
	nr			= 999;
	condition	= DIA_Engrom_KAP4_EXIT_Condition;
	information	= DIA_Engrom_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Engrom_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Engrom_KAP4_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


///////////////////////////////////////////////////////////////////////
//	Info perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Engrom_B_NpcObsessedByDMT		(C_INFO)
{
	npc		 = 	VLK_4131_Engrom;
	nr		 = 	32;
	condition	 = 	DIA_Engrom_B_NpcObsessedByDMT_Condition;
	information	 = 	DIA_Engrom_B_NpcObsessedByDMT_Info;

	description	 = 	"Wszystko w porz¹dku?";
};

func int DIA_Engrom_B_NpcObsessedByDMT_Condition ()
{
	if (NpcObsessedByDMT_Engrom == FALSE)
	&& (Kapitel >= 4)	
	 {
				return TRUE;
	 };
};

func void DIA_Engrom_B_NpcObsessedByDMT_Info ()
{
	MIS_Tabin_LookForEngrom = LOG_SUCCESS;
	B_NpcObsessedByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info bessen
///////////////////////////////////////////////////////////////////////
instance DIA_Engrom_BESSEN		(C_INFO)
{
	npc		 = 	VLK_4131_Engrom;
	nr		 = 	55;
	condition	 = 	DIA_Engrom_BESSEN_Condition;
	information	 = 	DIA_Engrom_BESSEN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Opêta³o ciê z³o.";
};

func int DIA_Engrom_BESSEN_Condition ()
{
 	if (NpcObsessedByDMT_Engrom == TRUE)
 	&& (NpcObsessedByDMT == FALSE)
	&& (Kapitel >= 4)	
	 {
				return TRUE;
	 };
};

func void DIA_Engrom_BESSEN_Info ()
{
	AI_Output			(other, self, "DIA_Engrom_BESSEN_15_00"); //Opêta³o ciê z³o.

	AI_Output			(other, self, "DIA_Engrom_BESSEN_15_01"); //Pozwól, ¿e ci pomogê.
	AI_Output			(self, other, "DIA_Engrom_BESSEN_12_02"); //Nie dotykaj mnie!

	B_NpcClearObsessionByDMT (self);
		
	Npc_SetTarget 		(self, other);
	
	self.aivar[AIV_INVINCIBLE] = FALSE; //HACK, weil durch AI_StartState (böse) Flag nicht zurückgesetzt wird 
	other.aivar[AIV_INVINCIBLE] = FALSE;
			
	AI_StartState 		(self, ZS_Flee, 0, "");	
};

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Engrom_KAP5_EXIT(C_INFO)
{
	npc			= VLK_4131_Engrom;
	nr			= 999;
	condition	= DIA_Engrom_KAP5_EXIT_Condition;
	information	= DIA_Engrom_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Engrom_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Engrom_KAP5_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Engrom_KAP6_EXIT(C_INFO)
{
	npc			= VLK_4131_Engrom;
	nr			= 999;
	condition	= DIA_Engrom_KAP6_EXIT_Condition;
	information	= DIA_Engrom_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Engrom_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Engrom_KAP6_EXIT_Info()
{	
	B_NpcClearObsessionByDMT (self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Engrom_PICKPOCKET (C_INFO)
{
	npc			= VLK_4131_Engrom;
	nr			= 900;
	condition	= DIA_Engrom_PICKPOCKET_Condition;
	information	= DIA_Engrom_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Engrom_PICKPOCKET_Condition()
{
	C_Beklauen (10, 5);
};
 
FUNC VOID DIA_Engrom_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Engrom_PICKPOCKET);
	Info_AddChoice		(DIA_Engrom_PICKPOCKET, DIALOG_BACK 		,DIA_Engrom_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Engrom_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Engrom_PICKPOCKET_DoIt);
};

func void DIA_Engrom_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Engrom_PICKPOCKET);
};
	
func void DIA_Engrom_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Engrom_PICKPOCKET);
};


