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

	description	 = 	"Jak to jde?";
};

func int DIA_Egill_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Egill_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Egill_HALLO_15_00"); //Co se stalo?
	AI_Output			(self, other, "DIA_Egill_HALLO_08_01"); //U� je to hodn� dlouho, co jsme na na�em pozemku naposledy vid�li n�jak�ho cizince, co n�s necht�l st�hnout z k��e.
	AI_Output			(self, other, "DIA_Egill_HALLO_08_02"); //Douf�m, �e se v tob� nem�l�m.
	AI_Output			(self, other, "DIA_Egill_HALLO_08_03"); //Jsem Egill.
	
	if (Hlp_IsValidNpc (Ehnim))
		&& (!C_NpcIsDown (Ehnim))
		{
			AI_Output			(self, other, "DIA_Egill_HALLO_08_04"); //A t�mhle ten divnej pt��ek je m�j bratr Ehnim.
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

	description	 = 	"Jak jdou poln� pr�ce?";
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
	AI_Output			(other, self, "DIA_Egill_FELDARBEIT_15_00"); //Jak jdou poln� pr�ce?
	AI_Output			(self, other, "DIA_Egill_FELDARBEIT_08_01"); //V�born�. Kdyby ty mizern� poln� �k�dci po��d neni�ili na�i �rodu...

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

	description	 = 	"Pro� s t�mi �k�dci n�co neud�l�te?";
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
	AI_Output			(other, self, "DIA_Egill_FELDRAEUBER_15_00"); //Pro� s t�mi �k�dci n�co neud�l�te?
	AI_Output			(self, other, "DIA_Egill_FELDRAEUBER_08_01"); //Si d�l� srandu. Od t� doby, co jsem na t�hle farm�, u� jsem jich zabil tolik, �e u� to ani nespo��t�m.
	AI_Output			(self, other, "DIA_Egill_FELDRAEUBER_08_02"); //Ale bohu�el, v�dycky p�ijdou dal��.
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

	description	 = 	"Tv�j bratr mi vypr�v�l n�co podobn�ho.";
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
	AI_Output			(other, self, "DIA_Egill_STREIT2_15_00"); //Tv�j bratr mi vypr�v�l n�co podobn�ho.
	AI_Output			(self, other, "DIA_Egill_STREIT2_08_01"); //(prohnan�) Aha. Co p�esn� ��kal?
	AI_Output			(other, self, "DIA_Egill_STREIT2_15_02"); //�e taky sejmul spoustu poln�ch �k�dc�.
	AI_Output			(self, other, "DIA_Egill_STREIT2_08_03"); //Co? Ten b��dil nedok�e s�m ani naj�t cestu dom�.
	AI_Output			(self, other, "DIA_Egill_STREIT2_08_04"); //�ekni mu, �e se takhle nem��e vytahovat.

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

	description	 = 	"Ehnim je kv�li tomu trochu na�tvanej.";
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
	AI_Output			(other, self, "DIA_Egill_STREIT4_15_00"); //Ehnim je kv�li tomu trochu na�tvanej.
	AI_Output			(self, other, "DIA_Egill_STREIT4_08_01"); //A� se tak nenaparuje, nebo mu utrhnu hlavu. �ekni mu to.

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
	AI_Output			(self, other, "DIA_Egill_PERMKAP1_08_00"); //Nenad�lal u� jsi dost �kody? M�m dojem, �e bys m�l vypadnout. Hned.

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


