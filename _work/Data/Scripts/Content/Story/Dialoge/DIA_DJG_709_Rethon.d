///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rethon_EXIT   (C_INFO)
{
	npc         = DJG_709_Rethon;
	nr          = 999;
	condition   = DIA_Rethon_EXIT_Condition;
	information = DIA_Rethon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Rethon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rethon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_HALLO		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	5;
	condition	 = 	DIA_Rethon_HALLO_Condition;
	information	 = 	DIA_Rethon_HALLO_Info;

	description	 = 	"�Qu� est�s haciendo aqu�?";
};

func int DIA_Rethon_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Rethon_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_HALLO_15_00"); //�Qu� haces aqu�?
	AI_Output			(self, other, "DIA_Rethon_HALLO_12_01"); //Estoy prepar�ndome para luchar. �Qu� otra cosa podr�a hacer?
};


 ///////////////////////////////////////////////////////////////////////
//	Info Kampf
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_KAMPF		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	6;
	condition	 = 	DIA_Rethon_KAMPF_Condition;
	information	 = 	DIA_Rethon_KAMPF_Info;

	description	 = 	"�Con qui�n quieres luchar?";
};

func int DIA_Rethon_KAMPF_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rethon_KAMPF_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_KAMPF_15_00"); //�Con qui�n quieres luchar?
	AI_Output			(self, other, "DIA_Rethon_KAMPF_12_01"); //Hab�a pensado en ir a ver a los paladines y darles una buena paliza.
	AI_Output			(self, other, "DIA_Rethon_KAMPF_12_02"); //Imb�cil. Con los dragones, por supuesto. �Qu� te cre�as?
};

///////////////////////////////////////////////////////////////////////
//	Info paladine
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_PALADINE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	6;
	condition	 = 	DIA_Rethon_PALADINE_Condition;
	information	 = 	DIA_Rethon_PALADINE_Info;

	description	 = 	"�A los paladines no les molestar� que est�s aqu�?";
};

func int DIA_Rethon_PALADINE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rethon_PALADINE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_PALADINE_15_00"); //�A los paladines no les importa que est�is aqu�?
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_01"); //Tonter�as. Tienen otros problemas. La mayor�a se alegran de seguir vivos.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_02"); //La moral de los muchachos no es la mejor. Eso ser� su perdici�n.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_03"); //Mira esas espadas melladas que arreglan para combatir con ellas.
	AI_Output			(self, other, "DIA_Rethon_PALADINE_12_04"); //Un guerrero razonable desertar�a de inmediato.

};


///////////////////////////////////////////////////////////////////////
//	Info WoGruppe
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_WOGRUPPE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	7;
	condition	 = 	DIA_Rethon_WOGRUPPE_Condition;
	information	 = 	DIA_Rethon_WOGRUPPE_Info;

	description	 = 	"�Te has separado de tu grupo?";
};

func int DIA_Rethon_WOGRUPPE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rethon_WOGRUPPE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_WOGRUPPE_15_00"); //�Te has separado de tu grupo?
	AI_Output			(self, other, "DIA_Rethon_WOGRUPPE_12_01"); //�Mi grupo? No pertenezco a ning�n grupo. Me dedico a coleccionar trofeos.
	AI_Output			(self, other, "DIA_Rethon_WOGRUPPE_12_02"); //Si vuelvo a casa sin ning�n trofeo, no sabr� a qu� he venido. Por eso no puedo ir con nadie.
};


///////////////////////////////////////////////////////////////////////
//	Info drachengesehen
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_DRACHENGESEHEN		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	8;
	condition	 = 	DIA_Rethon_DRACHENGESEHEN_Condition;
	information	 = 	DIA_Rethon_DRACHENGESEHEN_Info;

	description	 = 	"�Ya has visto alg�n drag�n?";
};

func int DIA_Rethon_DRACHENGESEHEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_KAMPF))
		{
				return TRUE;
		};
};

func void DIA_Rethon_DRACHENGESEHEN_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_DRACHENGESEHEN_15_00"); //�Ya has visto alg�n drag�n?
	AI_Output			(self, other, "DIA_Rethon_DRACHENGESEHEN_12_01"); //No. Quiero afilar las armas antes de partir.
};

///////////////////////////////////////////////////////////////////////
//	Info Angst
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_ANGST		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	9;
	condition	 = 	DIA_Rethon_ANGST_Condition;
	information	 = 	DIA_Rethon_ANGST_Info;

	description	 = 	"�No tienes miedo de que alguien te venza?";
};

func int DIA_Rethon_ANGST_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_WOGRUPPE))
		{
				return TRUE;
		};
};

func void DIA_Rethon_ANGST_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_15_00"); //�No tienes miedo de que alguien te venza?

	AI_Output			(self, other, "DIA_Rethon_ANGST_12_01"); //�Qu�? �Qui�n? �Sylvio?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Rethon_ANGST_12_02"); //Tu jefe piensa que puede forrarse, �eh?
			AI_Output			(other, self, "DIA_Rethon_ANGST_15_03"); //No soy uno de los hombres de Sylvio. Trabajo por mi cuenta.
			AI_Output			(self, other, "DIA_Rethon_ANGST_12_04"); //Oh. De acuerdo. Entonces, no he dicho nada.
		};

	AI_Output			(self, other, "DIA_Rethon_ANGST_12_05"); //�Has visto a los pobres diablos que lo acompa�an?
	AI_Output			(self, other, "DIA_Rethon_ANGST_12_06"); //Sylvio deber�a alegrarse si sale de aqu� con vida.

	if (Npc_IsDead(DJG_Sylvio))
	{
	AI_Output			(other, self, "DIA_Rethon_ANGST_15_07"); //No va a hacerlo. Ha muerto.
	AI_Output			(self, other, "DIA_Rethon_ANGST_12_08"); //Me parece bien.
	}
	else
	{
	Info_AddChoice	(DIA_Rethon_ANGST, DIALOG_BACK, DIA_Rethon_ANGST_weiter );
	Info_AddChoice	(DIA_Rethon_ANGST, "Parece que no te cae bien.", DIA_Rethon_ANGST_sylviomoegen );
	Info_AddChoice	(DIA_Rethon_ANGST, "�Y d�nde est� ahora Sylvio?", DIA_Rethon_ANGST_woSylvio );
	Info_AddChoice	(DIA_Rethon_ANGST, "�Sylvio ha estado aqu�?", DIA_Rethon_ANGST_sylviohier );
	};
};

func void DIA_Rethon_ANGST_weiter ()
{
	Info_ClearChoices	(DIA_Rethon_ANGST);
};

func void DIA_Rethon_ANGST_sylviohier ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_sylviohier_15_00"); //�Sylvio ha estado aqu�?
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviohier_12_01"); //�Te refieres al castillo? S�, estuvo aqu�, pero muy poco tiempo.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviohier_12_02"); //Habl� con unas cuantas personas y luego reemprendi� la marcha.

};

func void DIA_Rethon_ANGST_sylviomoegen ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_sylviomoegen_15_00"); //Parece que no te cae bien.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_01"); //�A qu� te refieres con lo de que no me cae bien? No me siento muy orgulloso de conocerlo.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_02"); //Sylvio no tiene amigos. Necesita gente que le siga a toda costa.
	AI_Output			(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_03"); //Eso no es para m�. Yo trabajo por mi cuenta.


};

func void DIA_Rethon_ANGST_woSylvio ()
{
	AI_Output			(other, self, "DIA_Rethon_ANGST_woSylvio_15_00"); //�Y d�nde est� ahora Sylvio?
	AI_Output			(self, other, "DIA_Rethon_ANGST_woSylvio_12_01"); //Los paladines mencionaron que en el oeste hab�a un drag�n de hielo. Se supone que es el m�s peligroso y poderoso de todos.
	AI_Output			(self, other, "DIA_Rethon_ANGST_woSylvio_12_02"); //Deber�as haber visto el brillo en los ojos de Sylvio cuando se enter�. Seguro que ha ido para all�.

	B_LogEntry (TOPIC_DRACHENJAGD,"Rethon, el cazador de dragones, mascull� algo acerca de un drag�n de hielo."); 
	B_LogEntry (TOPIC_Dragonhunter,"Sylvio estaba en el castillo y parti� en busca de un drag�n de hielo.");

};



///////////////////////////////////////////////////////////////////////
//	Info meineWaffe
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_MEINEWAFFE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	10;
	condition	 = 	DIA_Rethon_MEINEWAFFE_Condition;
	information	 = 	DIA_Rethon_MEINEWAFFE_Info;

	description	 = 	"�Me ayudas a mejorar mis armas?";
};

func int DIA_Rethon_MEINEWAFFE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_PALADINE))
		{
				return TRUE;
		};
};

func void DIA_Rethon_MEINEWAFFE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_MEINEWAFFE_15_00"); //�Me ayudas a mejorar mis armas?
	AI_Output			(self, other, "DIA_Rethon_MEINEWAFFE_12_01"); //�Mejorar? Ser� mejor que te compres algo nuevo y tires esa chatarra.
	AI_Output			(self, other, "DIA_Rethon_MEINEWAFFE_12_02"); //A lo mejor tengo algo para ti. �Te interesa?
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_TRADE		(C_INFO)
{
	npc		 = 	DJG_709_Rethon;
	nr		 = 	11;
	condition	 = 	DIA_Rethon_TRADE_Condition;
	information	 = 	DIA_Rethon_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	
	description	 = 	"�Qu� puedes venderme?";
};

func int DIA_Rethon_TRADE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_MEINEWAFFE))
		{
				return TRUE;
		};
};

func void DIA_Rethon_TRADE_Info ()
{
	AI_Output			(other, self, "DIA_Rethon_TRADE_15_00"); //�Qu� puedes venderme?
	B_GiveTradeInv (self);

	if (hero.guild == GIL_PAL)
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_01"); //Vaya, qu� bajo he ca�do. Hasta le vendo mis armas a un palad�n.
		}
	else if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_02"); //No tengo gran cosa para un mago, pero puedes echar un vistazo.
		}
	else
		{
			AI_Output			(self, other, "DIA_Rethon_TRADE_12_03"); //Creo que tengo lo que quieres, amigo.
		};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rethon_PICKPOCKET (C_INFO)
{
	npc			= DJG_709_Rethon;
	nr			= 900;
	condition	= DIA_Rethon_PICKPOCKET_Condition;
	information	= DIA_Rethon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Rethon_PICKPOCKET_Condition()
{
	C_Beklauen (78, 230);
};
 
FUNC VOID DIA_Rethon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rethon_PICKPOCKET);
	Info_AddChoice		(DIA_Rethon_PICKPOCKET, DIALOG_BACK 		,DIA_Rethon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rethon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rethon_PICKPOCKET_DoIt);
};

func void DIA_Rethon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rethon_PICKPOCKET);
};
	
func void DIA_Rethon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rethon_PICKPOCKET);
};


