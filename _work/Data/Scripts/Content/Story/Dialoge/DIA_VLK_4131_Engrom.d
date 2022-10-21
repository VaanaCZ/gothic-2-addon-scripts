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

	description	 = 	"Jak to jde?";
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
	AI_Output			(other, self, "DIA_Engrom_HALLO_15_00"); //Jak se vede?
	AI_Output			(self, other, "DIA_Engrom_HALLO_12_01"); //Mizern�!
	AI_Output			(other, self, "DIA_Engrom_HALLO_15_02"); //Mmh!
	AI_Output			(self, other, "DIA_Engrom_HALLO_12_03"); //Co chce� sly�et. Cel� dny ned�l�m nic jin�ho, ne� �e kouk�m na tuhle zatracenou �eku.
	AI_Output			(self, other, "DIA_Engrom_HALLO_12_04"); //Nalevo se fl�kaj� sk�eti, napravo banditi a ka�d� den j�m akor�t ��hav�� maso. V�, u� mi to v�ecko leze krkem.
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

	description	 = 	"P�em��lel jsi n�kdy o tom, �e odsud odejde�?";
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
	AI_Output			(other, self, "DIA_Engrom_WhatAboutLeaving_15_00"); //P�em��lel jsi n�kdy o tom, �e odsud odejde�?
	AI_Output			(self, other, "DIA_Engrom_WhatAboutLeaving_12_01"); //No jasn�, to p�eci nen� probl�m!
	AI_Output			(self, other, "DIA_Engrom_WhatAboutLeaving_12_02"); //Nejd��v se prosek�m tlupama sk�et�, pozdrav�m v�ecky ty ostatn� p��ery, co tu v�ude obch�zej�, a pak prost� projdu pr�smykem!
	AI_Output			(self, other, "DIA_Engrom_WhatAboutLeaving_12_03"); //To je p�ece sranda!
	AI_Output			(other, self, "DIA_Engrom_WhatAboutLeaving_15_04"); //J� se sem ale taky dostal.
	AI_Output			(self, other, "DIA_Engrom_WhatAboutLeaving_12_05"); //Chce� mi nakukat, �es prost� pro�el pr�smykem?
	AI_Output			(other, self, "DIA_Engrom_WhatAboutLeaving_15_06"); //V�cem�n� ano!
	AI_Output			(self, other, "DIA_Engrom_WhatAboutLeaving_12_07"); //Tak to jsi m�l teda kliku. Dokud tu bude v�echno vzh�ru nohama, ani se odsud nehnu.

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

	description	 = 	"Jak jde lov?";
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
	AI_Output			(self, other, "DIA_Engrom_Jagd_12_01"); //Jedinou �t�chu vid�m v lovu, ale r�d bych tu n�kdy vid�l i n�co jin�ho ne� po��d ty nechutn� ��havce.
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

	description	 = 	"Je v�echno v po��dku?";
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

	description	 = 	"Posedlo t� zlo.";
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
	AI_Output			(other, self, "DIA_Engrom_BESSEN_15_00"); //Posedlo t� zlo.

	AI_Output			(other, self, "DIA_Engrom_BESSEN_15_01"); //Dovol mi, abych ti pomohl.
	AI_Output			(self, other, "DIA_Engrom_BESSEN_12_02"); //(k�i��) Nesahej na m�!

	B_NpcClearObsessionByDMT (self);
		
	Npc_SetTarget 		(self, other);
	
	self.aivar[AIV_INVINCIBLE] = FALSE; //HACK, weil durch AI_StartState (b�se) Flag nicht zur�ckgesetzt wird 
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


