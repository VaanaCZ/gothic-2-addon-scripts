///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Fernando_EXIT   (C_INFO)
{
	npc         = VLK_405_Fernando;
	nr          = 999;
	condition   = DIA_Fernando_EXIT_Condition;
	information = DIA_Fernando_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Fernando_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fernando_EXIT_Info()
{
	B_NpcClearObsessionByDMT (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fernando_PICKPOCKET (C_INFO)
{
	npc			= VLK_405_Fernando;
	nr			= 900;
	condition	= DIA_Fernando_PICKPOCKET_Condition;
	information	= DIA_Fernando_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Robar su bolsa ser�a arriesgado).";
};                       

FUNC INT DIA_Fernando_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems (self, ItSe_GoldPocket100) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (50 - Theftdiff))
	&& (NpcObsessedByDMT_Fernando == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Fernando_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fernando_PICKPOCKET);
	Info_AddChoice		(DIA_Fernando_PICKPOCKET, DIALOG_BACK 		,DIA_Fernando_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fernando_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fernando_PICKPOCKET_DoIt);
};

func void DIA_Fernando_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 50)
	{
		
		B_GiveInvItems (self, other, ItSe_GoldPocket100, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Fernando_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		B_NpcClearObsessionByDMT (self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Fernando_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fernando_PICKPOCKET);
};
//*********************************************************************
//	Info Na.
//*********************************************************************

INSTANCE DIA_Fernando_Hello   (C_INFO)
{
	npc         = VLK_405_Fernando;
	nr          = 5;
	condition   = DIA_Fernando_Hello_Condition;
	information = DIA_Fernando_Hello_Info;
	permanent   = FALSE;
	description = "�Qu� tal va el negocio?";
};

FUNC INT DIA_Fernando_Hello_Condition()
{
	if (NpcObsessedByDMT_Fernando == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Fernando_Hello_Info()
{
	AI_Output (other,self ,"DIA_Fernando_Hello_15_00"); //�Qu� tal va el negocio?
	AI_Output (self ,other,"DIA_Fernando_Hello_14_01"); //No muy bien. Cuando la barrera a�n estaba en pie, las cosas iban mejor.
	AI_Output (self ,other,"DIA_Fernando_Hello_14_02"); //Los prisioneros extra�an cajas y cajas de mineral, y mis barcos las llevaban al continente.
	AI_Output (self ,other,"DIA_Fernando_Hello_14_03"); //Y, a la vuelta, tra�an comida y otras mercanc�as.
	AI_Output (self ,other,"DIA_Fernando_Hello_14_04"); //Pero ahora estamos aislados del continente y tenemos que confiar en los granjeros para obtener suministros.
};
//*********************************************************************
//	Info Perm
//*********************************************************************

INSTANCE DIA_Fernando_Perm   (C_INFO)
{
	npc         = VLK_405_Fernando;
	nr          = 850;
	condition   = DIA_Fernando_Perm_Condition;
	information = DIA_Fernando_Perm_Info;
	permanent   = TRUE;
	description = "�C�mo te ganas la vida ahora?";
};

FUNC INT DIA_Fernando_Perm_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Fernando_Hello))
	&& (NpcObsessedByDMT_Fernando == FALSE)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Fernando_Perm_Info()
{
	AI_Output (other,self ,"DIA_Fernando_Perm_15_00"); //�C�mo te ganas la vida ahora?

	if (Fernando_ImKnast == TRUE)
	{
		B_Say (self, other, "$NOTNOW");
	}
	else
	{
		if (Fernando_HatsZugegeben == TRUE)
		{
			AI_Output (self ,other,"DIA_Addon_Fernando_Perm_14_00"); //No lo s�, pero pase lo que pase, no quiero m�s trabajos sucios. Eso lo tengo claro.
		}	
		else if (Npc_KnowsInfo (other,DIA_Fernando_Success) == FALSE)
		{
			AI_Output (self ,other,"DIA_Fernando_Perm_14_01"); //Ahora mismo estoy viviendo de mis ahorros. Pero si no puedo volver a los negocios, se me va a poner la cosa muy cruda.
		}
		else
		{
			AI_Output (self ,other,"DIA_Fernando_Perm_14_02"); //Estoy arruinado. Deber�a haber hecho caso a mi padre y haberme alejado del negocio de la miner�a.
		};
	};
};
//*********************************************************************
//	Info Minental
//*********************************************************************
INSTANCE DIA_Fernando_Minental   (C_INFO)
{
	npc         = VLK_405_Fernando;
	nr          = 2;
	condition   = DIA_Fernando_Minental_Condition;
	information = DIA_Fernando_Minental_Info;
	permanent   = FALSE;
	important 	= TRUE;
};

FUNC INT DIA_Fernando_Minental_Condition()
{
	if (NpcObsessedByDMT_Fernando == FALSE)
	&& (MIS_OLDWORLD == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (EnterOW_Kapitel2 == FALSE)
	&& (Fernando_HatsZugegeben == FALSE)//ADDON
	&& (Fernando_ImKnast == FALSE) //HACK ADDON PATCH
	{
		return TRUE;
	};
};

FUNC VOID DIA_Fernando_Minental_Info()
{
	AI_Output (self ,other,"DIA_Fernando_Minental_14_00"); //Eh, t�, espera un minuto. Te diriges al Valle de las Minas, �no?
	AI_Output (other ,self,"DIA_Fernando_Minental_15_01"); //�Y?
	AI_Output (self ,other,"DIA_Fernando_Minental_14_02"); //Te ofrezco un trato. Me informas de lo que est� ocurriendo con el mineral y, a cambio, te consigo...
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Fernando_Minental_14_03"); //� una piedra r�nica.
	}
	else
	{
		AI_Output (self ,other,"DIA_Fernando_Minental_14_04"); //� un anillo que aumenta tu energ�a vital.
	};
	AI_Output (other ,self,"DIA_Fernando_Minental_15_05"); //Ver� qu� puedo hacer.
	
	B_NpcClearObsessionByDMT (self);
	Npc_ExchangeRoutine (self, "START");
	
	Log_CreateTopic (TOPIC_Fernando,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Fernando,LOG_RUNNING);
	B_LogEntry (TOPIC_Fernando,"Fernando, el mercader, quiere saber qu� pasa con el mineral del Valle de las Minas.");
};

///////////////////////////////////////////////////////////////////////
//	Info BanditTrader
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Fernando_BanditTrader		(C_INFO)
{
	npc		 = 	VLK_405_Fernando;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Fernando_BanditTrader_Condition;
	information	 = 	DIA_Addon_Fernando_BanditTrader_Info;

	description	 = 	"Has estado vendiendo armas a los bandidos.";
};

func int DIA_Addon_Fernando_BanditTrader_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Fernando_Hello))
	&& (NpcObsessedByDMT_Fernando == FALSE)
	&& 	(
		(Npc_HasItems (other,ItMw_Addon_BanditTrader))
		||(Npc_HasItems (other,ItRi_Addon_BanditTrader))
		||((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
		)
		{
			return TRUE;
		};
};

func void DIA_Addon_Fernando_BanditTrader_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_00"); //Has estado vendiendo armas a los bandidos.
	AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_01"); //(desconcertado) Pero� �Qu� te hace pensar ESO?

	B_LogEntry (TOPIC_Addon_BanditTrader,"Fernando, comerciante de ultramar, ha admitido que suministraba armas a los bandidos."); 

	B_GivePlayerXP (XP_Addon_Fernando_HatsZugegeben);
	Fernando_HatsZugegeben = TRUE;

	if	((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
	{
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_02"); //La lista de mercanc�as que llevaba un bandido lleva TU firma.
	};
	
	if (Npc_HasItems (other,ItRi_Addon_BanditTrader))
	{
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_03"); //Le he quitado a los bandidos este anillo de la cofrad�a de comercio de ultramar Araxos. T� eres miembro.

		if	(Npc_HasItems (other,ItMw_Addon_BanditTrader))
		{
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_04"); //Y las espadas que empu�aban los bandidos llevaban tus iniciales.
		};
	}
	else //nur (Npc_HasItems (other,ItMw_Addon_BanditTrader))
	{
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_05"); //Las espadas que empu�aban los bandidos llevaban tus iniciales.
	};

	AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_06"); //Adm�telo ya. Te he descubierto.

	if (Fernando_ImKnast == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_07"); //As� que has sido T�. T� me has delatado. Te har� pagar por ello.
		AI_Output	(other, self, "DIA_Addon_Fernando_BanditTrader_15_08"); //Antes tendr�as que salir de aqu� y no creo que te vayan a dejar en una buena temporada.
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_09"); //(enfadado, para s�) Llegar� mi hora.
		B_NpcClearObsessionByDMT (self);
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_10"); //(suplicante) No quer�a hacerlo, cr�eme.
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_11"); //(suplicante) Al principio s�lo me ped�an comida. Los negocios no marchaban bien, as� que me mezcl� m�s con ellos.
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_12"); //(suplicante) Entonces se volvieron m�s agresivos y amenazaron con matarme si no les vend�a las espadas que necesitaban.
		AI_Output	(self, other, "DIA_Addon_Fernando_BanditTrader_14_13"); //(suplicante) No puedes culparme. Soy v�ctima de las circunstancias.
		
		if (Fernando_ImKnast == FALSE)//Joly:zur Sicherheit
		{
			Info_ClearChoices	(DIA_Addon_Fernando_BanditTrader);
			Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "�Cu�nto me pagas si te dejo marchar?", DIA_Addon_Fernando_BanditTrader_preis );
			Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "La milicia se ocupar� de ti.", DIA_Addon_Fernando_BanditTrader_mil );
			Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "Qu� miedo...", DIA_Addon_Fernando_BanditTrader_Uptown );
		};
	};
};
func void DIA_Addon_Fernando_BanditTrader_Uptown ()
{
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_Uptown_15_00"); //Me vas a hacer llorar. Eres bastante repulsivo para vivir en el barrio alto.
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_Uptown_15_01"); //Vender�as tu alma por unas monedas de oro.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_Uptown_14_02"); //Tengo gastos que cubrir. Si no tengo dinero, me van a azuzar a las multitudes del distrito portuario.
};
func void DIA_Addon_Fernando_BanditTrader_mil ()
{
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_mil_15_00"); //La milicia se ocupar� de ti.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_mil_14_01"); //No puedes hacer esto.
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_mil_15_02"); //Yo dir�a que s�. Te vas a sorprender.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_mil_14_03"); //Por Innos. Estoy arruinado.
	B_NpcClearObsessionByDMT (self);
};
func void DIA_Addon_Fernando_BanditTrader_preis ()
{
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_preis_15_00"); //�Cu�nto me pagas si te dejo escapar?
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_preis_14_01"); //Sabes que no ando muy bien. No puedo darte mucho.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_preis_14_02"); //Te dar� 200 monedas de oro y un valioso anillo.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_preis_14_03"); //Con eso tendr� que valer. �Me devuelves ahora todo mi material?

	Info_ClearChoices	(DIA_Addon_Fernando_BanditTrader);
	Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "Olv�dalo. No pienso revel�rtelo.", DIA_Addon_Fernando_BanditTrader_nein );
	Info_AddChoice	(DIA_Addon_Fernando_BanditTrader, "Vale, est� bien. Trato hecho.", DIA_Addon_Fernando_BanditTrader_ja );
};
func void DIA_Addon_Fernando_BanditTrader_ja ()
{ 
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_ja_15_00"); //Vale, est� bien. Trato hecho.
	B_GivePlayerXP (XP_Ambient);
	Npc_RemoveInvItems	(hero ,ItMw_Addon_BanditTrader, Npc_HasItems (other,ItMw_Addon_BanditTrader));
	Npc_RemoveInvItem	(hero ,ItRi_Addon_BanditTrader);
	Npc_RemoveInvItem	(hero ,ItWr_Addon_BanditTrader);

	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_ja_14_01"); //Bien, toma tu oro.

	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);		
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_ja_14_02"); //Y el anillo. Estamos en paz.
	CreateInvItems (self, ItRi_Prot_Point_01, 1);									
	B_GiveInvItems (self, other, ItRi_Prot_Point_01, 1);		
	Info_ClearChoices	(DIA_Addon_Fernando_BanditTrader);
};
func void DIA_Addon_Fernando_BanditTrader_nein ()
{
	AI_Output			(other, self, "DIA_Addon_Fernando_BanditTrader_nein_15_00"); //No. Creo que voy a qued�rmelo.
	AI_Output			(self, other, "DIA_Addon_Fernando_BanditTrader_nein_14_01"); //Vale, qu�datelo, pero ay de ti como me delates.
	Info_ClearChoices	(DIA_Addon_Fernando_BanditTrader);
};
//*********************************************************************
//	Info Success
//*********************************************************************
INSTANCE DIA_Fernando_Success   (C_INFO)
{
	npc         = VLK_405_Fernando;
	nr          = 5;
	condition   = DIA_Fernando_Success_Condition;
	information = DIA_Fernando_Success_Info;
	permanent   = FALSE;
	description	= "He estado en el Valle de las Minas.";
};
FUNC INT DIA_Fernando_Success_Condition()
{
	if (NpcObsessedByDMT_Fernando == FALSE)
	&& (Kapitel >= 3)
	&& (Npc_KnowsInfo (other, DIA_Fernando_Minental))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Fernando_Success_Info()
{
	AI_Output (other ,self,"DIA_Fernando_Success_15_00"); //He estado en el Valle de las Minas.
	
	if (Fernando_ImKnast == FALSE)
	{
		Fernando_Erz = TRUE;
		B_GivePlayerXP (XP_Ambient);
		
		AI_Output (self ,other,"DIA_Fernando_Success_14_01"); //�Y? �C�mo est� la situaci�n all�?
		AI_Output (other ,self,"DIA_Fernando_Success_15_02"); //Las minas est�n todas vac�as. Pr�cticamente no quedan m�s que unos cuantos cofres llenos de mineral. Casi ni merece la pena excavar para eso.
		AI_Output (self ,other,"DIA_Fernando_Success_14_03"); //�No puede ser cierto! Eso significa que estoy arruinado...
	
		if (Fernando_HatsZugegeben == FALSE)
		{
			AI_Output (other ,self,"DIA_Fernando_Success_15_04"); //�Qu� hay de nuestro trato?
			AI_Output (self ,other,"DIA_Fernando_Success_14_05"); //Bien, sobre tu recompensa...
			
			if (other.guild == GIL_KDF)
			{
				AI_Output (self ,other,"DIA_Fernando_Minental_14_06"); //Aqu� tienes esta piedra r�nica.
				B_GiveInvItems (self,other, ItmI_RuneBlank,1);
			}
			else
			{
				AI_Output (self ,other,"DIA_Fernando_Minental_14_07"); //Aqu� est� tu anillo.
				B_GiveInvItems (self,other, ItRi_Hp_02,1);
			};
		};
	}
	else 
	{
		B_Say (self, other, "$NOTNOW");
		Log_SetTopicStatus (TOPIC_Fernando, LOG_OBSOLETE);
		B_LogEntry (TOPIC_Fernando,"Fernando ya no quiere la informaci�n. Y a mi ya no me van a pagar.");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Obsession
///////////////////////////////////////////////////////////////////////
instance DIA_Fernando_Obsession		(C_INFO)
{
	npc		 = 	VLK_405_Fernando;
	nr		 = 	30;
	condition	 = 	DIA_Fernando_Obsession_Condition;
	information	 = 	DIA_Fernando_Obsession_Info;

	description	 = 	"�Est�s bien?";
};

func int DIA_Fernando_Obsession_Condition ()
{
	if (Kapitel >= 3)
	&& (NpcObsessedByDMT_Fernando == FALSE)
	&& (hero.guild == GIL_KDF)
		{
				return TRUE;
		};
};

func void DIA_Fernando_Obsession_Info ()
{
	B_NpcObsessedByDMT (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Fernando_Heilung		(C_INFO)
{
	npc		 = 	VLK_405_Fernando;
	nr		 = 	55;
	condition	 = 	DIA_Fernando_Heilung_Condition;
	information	 = 	DIA_Fernando_Heilung_Info;
	permanent	 = 	TRUE;

	description	 = 	"�Est�s pose�do!";
};

func int DIA_Fernando_Heilung_Condition ()
{
 	if (NpcObsessedByDMT_Fernando == TRUE) && (NpcObsessedByDMT == FALSE)
	&& (hero.guild == GIL_KDF)
	 {
				return TRUE;
	 };
};

func void DIA_Fernando_Heilung_Info ()
{
	AI_Output			(other, self, "DIA_Fernando_Heilung_15_00"); //�Est�s pose�do!
	AI_Output			(self, other, "DIA_Fernando_Heilung_14_01"); //Vete. Vete ya.
	B_NpcClearObsessionByDMT (self);
};







