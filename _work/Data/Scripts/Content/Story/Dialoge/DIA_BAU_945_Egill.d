///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Egill_EXIT   (C_INFO)
{
	npc         = BAU_945_Egill;
	nr          = 999;
	condition   = DIA_Egill_EXIT_Condition;
	information = DIA_Egill_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Egill_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Egill_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Egill_HALLO		(C_INFO)
{
	npc		 = 	BAU_945_Egill;
	nr		 = 	3;
	condition	 = 	DIA_Egill_HALLO_Condition;
	information	 = 	DIA_Egill_HALLO_Info;

	description	 = 	"Wie sieht's aus?";
};

func int DIA_Egill_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Egill_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Egill_HALLO_15_00"); //Wie sieht's aus?
	AI_Output			(self, other, "DIA_Egill_HALLO_08_01"); //Schon lange keinen Fremden mehr auf unserem Land gesehen, der uns nicht gleich die Haut abziehen will.
	AI_Output			(self, other, "DIA_Egill_HALLO_08_02"); //Ich hoffe, ich habe mich jetzt nicht bei dir getäuscht.
	AI_Output			(self, other, "DIA_Egill_HALLO_08_03"); //Ich bin Egill.
	
	if (Hlp_IsValidNpc (Ehnim))
		&& (!C_NpcIsDown (Ehnim))
		{
			AI_Output			(self, other, "DIA_Egill_HALLO_08_04"); //Und der komische Vogel dort drüben ist mein Bruder Ehnim.
		};
};


///////////////////////////////////////////////////////////////////////
//	Info feldarbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Egill_FELDARBEIT		(C_INFO)
{
	npc		 = 	BAU_945_Egill;
	nr		 = 	4;
	condition	 = 	DIA_Egill_FELDARBEIT_Condition;
	information	 = 	DIA_Egill_FELDARBEIT_Info;

	description	 = 	"Wie läuft die Feldarbeit?";
};

func int DIA_Egill_FELDARBEIT_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Egill_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Egill_FELDARBEIT_Info ()
{
	AI_Output			(other, self, "DIA_Egill_FELDARBEIT_15_00"); //Wie läuft die Feldarbeit?
	AI_Output			(self, other, "DIA_Egill_FELDARBEIT_08_01"); //Bestens. Wenn diese elenden Feldräuber nicht ständig unsere Ernte vernichten würden ...

};


///////////////////////////////////////////////////////////////////////
//	Info Feldraeuber
///////////////////////////////////////////////////////////////////////
instance DIA_Egill_FELDRAEUBER		(C_INFO)
{
	npc		 = 	BAU_945_Egill;
	nr		 = 	5;
	condition	 = 	DIA_Egill_FELDRAEUBER_Condition;
	information	 = 	DIA_Egill_FELDRAEUBER_Info;

	description	 = 	"Warum unternimmst du nichts gegen die Feldräuber?";
};

func int DIA_Egill_FELDRAEUBER_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Egill_FELDARBEIT))
		{
				return TRUE;
		};
};

func void DIA_Egill_FELDRAEUBER_Info ()
{
	AI_Output			(other, self, "DIA_Egill_FELDRAEUBER_15_00"); //Warum unternimmst du nichts gegen die Feldräuber?
	AI_Output			(self, other, "DIA_Egill_FELDRAEUBER_08_01"); //Du machst mir Spaß. Seit ich hier auf diesem Hof bin, habe ich schon unzählige dieser Viecher erledigt.
	AI_Output			(self, other, "DIA_Egill_FELDRAEUBER_08_02"); //Es kommen aber leider immer wieder neue.
};


///////////////////////////////////////////////////////////////////////
//	Info Streit2
///////////////////////////////////////////////////////////////////////
instance DIA_Egill_STREIT2		(C_INFO)
{
	npc		 = 	BAU_945_Egill;
	nr		 = 	6;
	condition	 = 	DIA_Egill_STREIT2_Condition;
	information	 = 	DIA_Egill_STREIT2_Info;

	description	 = 	"Dein Bruder erzählt etwas Ähnliches.";
};

func int DIA_Egill_STREIT2_Condition ()
{
	if		(
			(Npc_KnowsInfo(other, DIA_Egill_FELDRAEUBER))
			&& (Npc_KnowsInfo(other, DIA_Ehnim_FELDRAEUBER))
			)
		&&
			(
			(Hlp_IsValidNpc (Ehnim))
			&& (!C_NpcIsDown (Ehnim))
			)
				{
						return TRUE;
				};
};

func void DIA_Egill_STREIT2_Info ()
{
	AI_Output			(other, self, "DIA_Egill_STREIT2_15_00"); //Dein Bruder erzählt etwas Ähnliches.
	AI_Output			(self, other, "DIA_Egill_STREIT2_08_01"); //(lauernd) Aha. Was denn genau?
	AI_Output			(other, self, "DIA_Egill_STREIT2_15_02"); //Dass er auch schon viele Feldräuber zur Strecke gebracht hat.
	AI_Output			(self, other, "DIA_Egill_STREIT2_08_03"); //Was? Der Blindgänger findet doch noch nicht mal alleine nach Hause.
	AI_Output			(self, other, "DIA_Egill_STREIT2_08_04"); //Sag ihm, er soll mal nicht so aufschneiden.

	AI_StopProcessInfos (self);
};



///////////////////////////////////////////////////////////////////////
//	Info Streit4
///////////////////////////////////////////////////////////////////////
instance DIA_Egill_STREIT4		(C_INFO)
{
	npc		 = 	BAU_945_Egill;
	nr		 = 	7;
	condition	 = 	DIA_Egill_STREIT4_Condition;
	information	 = 	DIA_Egill_STREIT4_Info;

	description	 = 	"Ehnim ist wegen der Geschichte ein wenig gereizt.";
};

func int DIA_Egill_STREIT4_Condition ()
{
	if 	(
			(Npc_KnowsInfo(other, DIA_Ehnim_STREIT3))
		&&
			(
			(Hlp_IsValidNpc (Ehnim))
			&& (!C_NpcIsDown (Ehnim))
			)
		)
			{
					return TRUE;
			};
};

func void DIA_Egill_STREIT4_Info ()
{
	AI_Output			(other, self, "DIA_Egill_STREIT4_15_00"); //Ehnim ist wegen der Geschichte ein wenig gereizt.
	AI_Output			(self, other, "DIA_Egill_STREIT4_08_01"); //Er soll sich nicht so aufblasen, sonst reiß ich ihm den Kopf ab. Sag ihm das.

	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Egill_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_945_Egill;
	condition	 = 	DIA_Egill_PERMKAP1_Condition;
	information	 = 	DIA_Egill_PERMKAP1_Info;
	important	 = 	TRUE;
	permanent	 =	TRUE;
};

func int DIA_Egill_PERMKAP1_Condition ()
{
	if 	(
		(DIA_Ehnim_STREIT5_noPerm == TRUE)
		&& (Npc_IsInState (self,ZS_Talk))
		)
			{
					return TRUE;
			};
};

func void DIA_Egill_PERMKAP1_Info ()
{
	AI_Output			(self, other, "DIA_Egill_PERMKAP1_08_00"); //Hast du nicht genug Schaden angerichtet? Ich finde, du solltest jetzt gehen.

	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Egill_PICKPOCKET (C_INFO)
{
	npc			= BAU_945_Egill;
	nr			= 900;
	condition	= DIA_Egill_PICKPOCKET_Condition;
	information	= DIA_Egill_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Egill_PICKPOCKET_Condition()
{
	C_Beklauen (45, 24);
};
 
FUNC VOID DIA_Egill_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Egill_PICKPOCKET);
	Info_AddChoice		(DIA_Egill_PICKPOCKET, DIALOG_BACK 		,DIA_Egill_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Egill_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Egill_PICKPOCKET_DoIt);
};

func void DIA_Egill_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Egill_PICKPOCKET);
};
	
func void DIA_Egill_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Egill_PICKPOCKET);
};


