///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Ehnim_EXIT   (C_INFO)
{
	npc         = BAU_944_Ehnim;
	nr          = 999;
	condition   = DIA_Ehnim_EXIT_Condition;
	information = DIA_Ehnim_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Ehnim_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Ehnim_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_HALLO		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	nr		 = 	3;
	condition	 = 	DIA_Ehnim_HALLO_Condition;
	information	 = 	DIA_Ehnim_HALLO_Info;

	description	 = 	"¿Quién eres tú?";
};

func int DIA_Ehnim_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Ehnim_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_HALLO_15_00"); //¿Quién eres tú?
	AI_Output			(self, other, "DIA_Ehnim_HALLO_12_01"); //Me llamo Ehnim. Soy uno de los braceros.

	if	(
		(Hlp_IsValidNpc (Egill))
		&& (!C_NpcIsDown (Egill))
		)
			{
				AI_Output			(self, other, "DIA_Ehnim_HALLO_12_02"); //Y ese canijo es mi hermano Egill.
			};
	AI_Output			(self, other, "DIA_Ehnim_HALLO_12_03"); //Llevamos varios años trabajando aquí en la granja de Akil.

};


///////////////////////////////////////////////////////////////////////
//	Info Feldarbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_FELDARBEIT		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	nr		 = 	4;
	condition	 = 	DIA_Ehnim_FELDARBEIT_Condition;
	information	 = 	DIA_Ehnim_FELDARBEIT_Info;

	description	 = 	"¿Cómo va la labranza?";
};

func int DIA_Ehnim_FELDARBEIT_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Ehnim_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Ehnim_FELDARBEIT_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_FELDARBEIT_15_00"); //¿Cómo va la labranza?
	AI_Output			(self, other, "DIA_Ehnim_FELDARBEIT_12_01"); //¿Quieres echar una mano? Ahí hay otro azadón. Cógelo y ve a las tierras.
	AI_Output			(self, other, "DIA_Ehnim_FELDARBEIT_12_02"); //Procura que los incursores de campo no te pillen desprevenido. Te arrancarían el brazo de un bocado.

};

///////////////////////////////////////////////////////////////////////
//	Info feldraeuber
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_FELDRAEUBER		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	nr		 = 	5;
	condition	 = 	DIA_Ehnim_FELDRAEUBER_Condition;
	information	 = 	DIA_Ehnim_FELDRAEUBER_Info;

	description	 = 	"¿Por qué no hacéis algo con los incursores de campo?";
};

func int DIA_Ehnim_FELDRAEUBER_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Ehnim_FELDARBEIT))
		{
				return TRUE;
		};
};

func void DIA_Ehnim_FELDRAEUBER_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_FELDRAEUBER_15_00"); //¿Por qué no hacéis algo con los incursores de campo?
	AI_Output			(self, other, "DIA_Ehnim_FELDRAEUBER_12_01"); //Ya no sé cuántos he matado, pero siguen viniendo.

};

///////////////////////////////////////////////////////////////////////
//	Info Streit1
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_STREIT1		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	nr		 = 	6;
	condition	 = 	DIA_Ehnim_STREIT1_Condition;
	information	 = 	DIA_Ehnim_STREIT1_Info;

	description	 = 	"Tu hermano me dijo lo mismo.";
};

func int DIA_Ehnim_STREIT1_Condition ()
{
	if 	(
			(
			(Npc_KnowsInfo(other, DIA_Egill_FELDRAEUBER))
			&& (Npc_KnowsInfo(other, DIA_Ehnim_FELDRAEUBER))
			&& ((Npc_KnowsInfo(other, DIA_Egill_STREIT2))== FALSE)
			)
		&&
			(
			(Hlp_IsValidNpc (Egill))
			&& (!C_NpcIsDown (Egill))
			)
		)
				{
					return TRUE;
				};
			
};

func void DIA_Ehnim_STREIT1_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_STREIT1_15_00"); //Tu hermano me dijo lo mismo.
	AI_Output			(self, other, "DIA_Ehnim_STREIT1_12_01"); //¿Qué? ¿Ese holgazán? Siempre desaparece en cuanto las bestias aparecen en nuestras tierras.
	AI_Output			(self, other, "DIA_Ehnim_STREIT1_12_02"); //No debería decir tantas tonterías.
};

///////////////////////////////////////////////////////////////////////
//	Info Streit3
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_STREIT3		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	nr		 = 	7;
	condition	 = 	DIA_Ehnim_STREIT3_Condition;
	information	 = 	DIA_Ehnim_STREIT3_Info;

	description	 = 	"Tu hermano piensa que eres un fanfarrón.";
};

func int DIA_Ehnim_STREIT3_Condition ()
{
	if 	(
			(Npc_KnowsInfo(other, DIA_Egill_STREIT2))
		&&
			(
			(Hlp_IsValidNpc (Egill))
			&& (!C_NpcIsDown (Egill))
			)
		)	
			{
					return TRUE;
			};
};

func void DIA_Ehnim_STREIT3_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_STREIT3_15_00"); //Tu hermano piensa que eres un fanfarrón.
	AI_Output			(self, other, "DIA_Ehnim_STREIT3_12_01"); //¿Qué? ¿Tiene la cara de decir eso?
	AI_Output			(self, other, "DIA_Ehnim_STREIT3_12_02"); //Como no se ande con ojo, voy a tener que darle una lección.
	AI_Output			(self, other, "DIA_Ehnim_STREIT3_12_03"); //Ve y díselo.
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Streit5
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_STREIT5		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	nr		 = 	8;
	condition	 = 	DIA_Ehnim_STREIT5_Condition;
	information	 = 	DIA_Ehnim_STREIT5_Info;
	permanent	 =  TRUE;

	description	 = 	"Creo que los dos os deberíais tranquilizar.";
};

var int DIA_Ehnim_STREIT5_noPerm;

func int DIA_Ehnim_STREIT5_Condition ()
{
	if 	(
			(Npc_KnowsInfo(other, DIA_Egill_STREIT4))
		&&
			(
			(Hlp_IsValidNpc (Egill))
			&& (!C_NpcIsDown (Egill))
			)
		&& (DIA_Ehnim_STREIT5_noPerm == FALSE)
		)	
				{
						return TRUE;
				};
};

func void DIA_Ehnim_STREIT5_Info ()
{
	AI_Output			(other, self, "DIA_Ehnim_STREIT5_15_00"); //Creo que los dos os deberíais tranquilizar.
	AI_Output			(self, other, "DIA_Ehnim_STREIT5_12_01"); //El cerdo no cede, ¿verdad?
	AI_Output			(self, other, "DIA_Ehnim_STREIT5_12_02"); //Voy a sacarle las tripas. Díselo.

	Info_ClearChoices	(DIA_Ehnim_STREIT5);

	Info_AddChoice	(DIA_Ehnim_STREIT5, "Haz lo que te parezca. Yo me largo.", DIA_Ehnim_STREIT5_gehen );
	Info_AddChoice	(DIA_Ehnim_STREIT5, "¿Por qué no se lo dices tú?", DIA_Ehnim_STREIT5_Attack );


};
func void DIA_Ehnim_STREIT5_Attack ()
{
	AI_Output			(other, self, "DIA_Ehnim_STREIT5_Attack_15_00"); //¿Por qué no se lo dices tú?
	AI_Output			(self, other, "DIA_Ehnim_STREIT5_Attack_12_01"); //Voy a hacerlo.

	AI_StopProcessInfos (self);

	DIA_Ehnim_STREIT5_noPerm = TRUE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_Attack (self, Egill, AR_NONE, 0);
	
	B_GivePlayerXP (XP_EgillEhnimStreit);
	
};

func void DIA_Ehnim_STREIT5_gehen ()
{
	AI_Output			(other, self, "DIA_Ehnim_STREIT5_gehen_15_00"); //Haz lo que te parezca. Yo me largo.
	AI_Output			(self ,other, "DIA_Ehnim_STREIT5_gehen_12_01"); //Sí, escabúllete.
	
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	condition	 = 	DIA_Ehnim_PERMKAP1_Condition;
	information	 = 	DIA_Ehnim_PERMKAP1_Info;
	important	 = 	TRUE;
	permanent	 =	TRUE;
};

func int DIA_Ehnim_PERMKAP1_Condition ()
{
	if 	(
		(DIA_Ehnim_STREIT5_noPerm == TRUE)
		&& (Npc_IsInState (self,ZS_Talk))
		&& ((Kapitel < 3) || (hero.guild == GIL_KDF))
		)
			{
					return TRUE;
			};
};

func void DIA_Ehnim_PERMKAP1_Info ()
{
	AI_Output			(self, other, "DIA_Ehnim_PERMKAP1_12_00"); //¿Quieres armar más líos? Creo que harías bien en irte.

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info MoleRatFett
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_MoleRatFett		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	condition	 = 	DIA_Ehnim_MoleRatFett_Condition;
	information	 = 	DIA_Ehnim_MoleRatFett_Info;
	important	 = 	TRUE;
};

func int DIA_Ehnim_MoleRatFett_Condition ()
{
	if 	(
		(DIA_Ehnim_STREIT5_noPerm == TRUE)
		&& (Kapitel >= 3)
		&& (hero.guild != GIL_KDF)
		)
			{
					return TRUE;
			};
};

func void DIA_Ehnim_MoleRatFett_Info ()
{
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_12_00"); //Sigues aquí.
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_15_01"); //Es evidente. ¿Sigues picado?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_12_02"); //Da igual, no te preocupes. Oye, ¿has estado últimamente en la granja de Lobart?
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_15_03"); //Puede. ¿Por qué?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_12_04"); //Oh, por nada importante. Quería volver a hablar con Vino de su alambique.
	
	Info_ClearChoices	(DIA_Ehnim_MoleRatFett);
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Ahora mismo no tengo tiempo.", DIA_Ehnim_MoleRatFett_nein );
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "¿Alambique? ¿Qué alambique?", DIA_Ehnim_MoleRatFett_was );

	if (Npc_IsDead(Vino))
	{
		Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Vino ha muerto.", DIA_Ehnim_MoleRatFett_tot );
	};

};
func void DIA_Ehnim_MoleRatFett_tot ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_tot_15_00"); //Vino ha muerto.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_tot_12_01"); //Caramba. Bueno, entonces no hay más que hablar.

};

func void DIA_Ehnim_MoleRatFett_was ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_15_00"); //¿Alambique? ¿Qué alambique?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_12_01"); //¡Oh! No tenía que haber dicho nada. Vino siempre ha sido muy maniático con su secretito.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_12_02"); //Da igual, ya lo he soltado. Vino tiene un alambique secreto en el bosque.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_12_03"); //Hace un tiempo me pidió que le consiguiese algo para engrasar el rastrillo.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_12_04"); //Últimamente ha llovido mucho, y el cacharro se ha oxidado y se ha bloqueado. La manivela se ha atascado y nadie puede entrar. Menudo lío.

	Log_CreateTopic (TOPIC_FoundVinosKellerei, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FoundVinosKellerei, LOG_RUNNING);
	B_LogEntry (TOPIC_FoundVinosKellerei,"Ehnim me dijo que Vino tiene un alambique secreto en el bosque cercano a la granja de Akil. Pero el mecanismo que abre la puerta está atascado y solo puede abrirse usando grasa de ratopo."); 
	
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "¿Y? ¿Tienes la grasa?", DIA_Ehnim_MoleRatFett_was_Fett );
};
func void DIA_Ehnim_MoleRatFett_was_Fett ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_15_00"); //¿Y? ¿Tienes la grasa?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_12_01"); //Sí, claro. La mejor que hay. Grasa de ratopo. Te juro que es buenísima. Se usaba para engrasar los cañones de los barcos.
	
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Véndeme la grasa.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill );

};
var int Ehnim_MoleRatFettOffer;
func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_00"); //Véndeme la grasa.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_01"); //No te va a salir barata, amigo. Apenas hay en esta región del país.
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_02"); //¿Cuánto?
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_03"); //Um... ¿100 monedas de oro?
	Ehnim_MoleRatFettOffer = 100;

	Info_ClearChoices	(DIA_Ehnim_MoleRatFett);
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Es demasiado.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel );
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Trato hecho.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja );

};
func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_15_00"); //Trato hecho.

	if (B_GiveInvItems (other, self, ItMi_Gold,Ehnim_MoleRatFettOffer))
		{
			AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_01"); //Muy bien. Ten.
			
			if (Npc_HasItems (self,ItMi_Moleratlubric_MIS))
			{
				B_GiveInvItems (self, other, ItMi_Moleratlubric_MIS, 1);
				
				if (Npc_IsDead(Vino) == FALSE)
					{
						AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_02"); //(Para sí) Caramba. Vino va a matarme.
					};					
			}
			else
			{
				AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_03"); //Maldita sea, ¿dónde está? Menudo fastidio. Lo siento, parece que no me queda. Aquí tienes tu dinero.
				B_GiveInvItems (self, other, ItMi_Gold,Ehnim_MoleRatFettOffer);
				
				if (Npc_IsDead(Egill) == FALSE)
					{
						AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_04"); //Seguro que esto es obra de mi hermano. Qué cerdo.
						AI_StopProcessInfos (self);
						other.aivar[AIV_INVINCIBLE] = FALSE;
						B_Attack (self, Egill, AR_NONE, 0);
					};
			};
		}
	else
		{
			AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_05"); //Genial. Primero te quejas y luego ni siquiera tienes el dinero. Lárgate.
		};
	AI_StopProcessInfos (self);
};

func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_15_00"); //Es demasiado.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_12_01"); //Vale, vale. Entonces 70 monedas de oro. Pero es mi última oferta.
	Ehnim_MoleRatFettOffer = 70;

	Info_ClearChoices	(DIA_Ehnim_MoleRatFett);
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Sigue siendo demasiado.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_immernoch );
	Info_AddChoice	(DIA_Ehnim_MoleRatFett, "Trato hecho.", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja );

};
func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_immernoch ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_was_immernoch_15_00"); //Sigue siendo demasiado.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_was_immernoch_12_01"); //(Enojado) Entonces ni hablar. Que te vaya bien.
	AI_StopProcessInfos (self);
};

func void DIA_Ehnim_MoleRatFett_nein ()
{
	AI_Output			(other, self, "DIA_Ehnim_MoleRatFett_nein_15_00"); //Ahora mismo no tengo tiempo.
	AI_Output			(self, other, "DIA_Ehnim_MoleRatFett_nein_12_01"); //No te quiero entretener, tío.
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info permKap3
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_PERMKAP3		(C_INFO)
{
	npc		 = 	BAU_944_Ehnim;
	condition	 = 	DIA_Ehnim_PERMKAP3_Condition;
	information	 = 	DIA_Ehnim_PERMKAP3_Info;
	important	 = 	TRUE;
	permanent	 =	TRUE;
};

func int DIA_Ehnim_PERMKAP3_Condition ()
{
	if 	(
		(Npc_KnowsInfo(other, DIA_Ehnim_MoleRatFett))
		&& (Npc_IsInState (self,ZS_Talk))
		)
			{
					return TRUE;
			};
};

func void DIA_Ehnim_PERMKAP3_Info ()
{
	AI_Output			(self, other, "DIA_Ehnim_PERMKAP3_12_00"); //Ahora no tengo tiempo.
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Ehnim_PICKPOCKET (C_INFO)
{
	npc			= BAU_944_Ehnim;
	nr			= 900;
	condition	= DIA_Ehnim_PICKPOCKET_Condition;
	information	= DIA_Ehnim_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Ehnim_PICKPOCKET_Condition()
{
	C_Beklauen (76, 35);
};
 
FUNC VOID DIA_Ehnim_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Ehnim_PICKPOCKET);
	Info_AddChoice		(DIA_Ehnim_PICKPOCKET, DIALOG_BACK 		,DIA_Ehnim_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Ehnim_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Ehnim_PICKPOCKET_DoIt);
};

func void DIA_Ehnim_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Ehnim_PICKPOCKET);
};
	
func void DIA_Ehnim_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Ehnim_PICKPOCKET);
};
























