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

	description	 = 	"¿Qué pasa?";
};

func int DIA_Egill_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Egill_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Egill_HALLO_15_00"); //¿Qué pasa?
	AI_Output			(self, other, "DIA_Egill_HALLO_08_01"); //Hace mucho que no viene un forastero a nuestras tierras que no quiera despellejarnos.
	AI_Output			(self, other, "DIA_Egill_HALLO_08_02"); //Espero no equivocarme contigo.
	AI_Output			(self, other, "DIA_Egill_HALLO_08_03"); //Me llamo Egill.
	
	if (Hlp_IsValidNpc (Ehnim))
		&& (!C_NpcIsDown (Ehnim))
		{
			AI_Output			(self, other, "DIA_Egill_HALLO_08_04"); //Y ese pajarraco es mi hermano Ehnim.
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

	description	 = 	"¿Cómo va la labranza?";
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
	AI_Output			(other, self, "DIA_Egill_FELDARBEIT_15_00"); //¿Cómo va la labranza?
	AI_Output			(self, other, "DIA_Egill_FELDARBEIT_08_01"); //Muy bien. Si esos asquerosos incursores de campo no destruyeran la cosecha constantemente...

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

	description	 = 	"¿Por qué no hacéis algo con los incursores de campo?";
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
	AI_Output			(other, self, "DIA_Egill_FELDRAEUBER_15_00"); //¿Por qué no hacéis algo con los incursores de campo?
	AI_Output			(self, other, "DIA_Egill_FELDRAEUBER_08_01"); //¿Me tomas el pelo? Desde que estoy en la granja, he perdido la cuenta de todas las bestias que he matado.
	AI_Output			(self, other, "DIA_Egill_FELDRAEUBER_08_02"); //Pero lamentablemente llegan más.
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

	description	 = 	"Tu hermano dice algo parecido.";
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
	AI_Output			(other, self, "DIA_Egill_STREIT2_15_00"); //Tu hermano dice algo parecido.
	AI_Output			(self, other, "DIA_Egill_STREIT2_08_01"); //(Astuto) Ajá. ¿Qué dice exactamente?
	AI_Output			(other, self, "DIA_Egill_STREIT2_15_02"); //Que también ha matado un montón de incursores de campo.
	AI_Output			(self, other, "DIA_Egill_STREIT2_08_03"); //¿Qué? Ese perdedor ni siquiera sabe volver solo a casa.
	AI_Output			(self, other, "DIA_Egill_STREIT2_08_04"); //Dile que no debería alardear.

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

	description	 = 	"Ehnim está algo enfadado.";
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
	AI_Output			(other, self, "DIA_Egill_STREIT4_15_00"); //Ehnim está algo enfadado.
	AI_Output			(self, other, "DIA_Egill_STREIT4_08_01"); //Si no quiere que le arranque la cabeza, no debería hincharse tanto. Díselo.

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
	AI_Output			(self, other, "DIA_Egill_PERMKAP1_08_00"); //¿No has causado suficiente daño? Será mejor que te vayas.

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


