
//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################



//***************************************************************************
//	Info EXIT
//***************************************************************************
INSTANCE DIA_SylvioDJG_EXIT (C_INFO)
{
	npc			= DJG_700_Sylvio;
	nr   		= 999;
	condition	= DIA_SylvioDJG_EXIT_Condition;
	information	= DIA_SylvioDJG_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SylvioDJG_EXIT_Condition()
{
	return 1;
};

func VOID DIA_SylvioDJG_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info HelloAgain
///////////////////////////////////////////////////////////////////////
instance DIA_SylvioDJG_HelloAgain		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	condition	 = 	DIA_SylvioDJG_HelloAgain_Condition;
	information	 = 	DIA_SylvioDJG_HelloAgain_Info;
	important	 = 	TRUE;

};

func int DIA_SylvioDJG_HelloAgain_Condition ()
{
	if 	((Npc_IsDead(IceDragon))== FALSE)
		&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE)
			{
				return TRUE;
			};
};

func void DIA_SylvioDJG_HelloAgain_Info ()
{
	if((other.guild == GIL_SLD)||(other.guild == GIL_DJG))
	{
		AI_Output			(self, other,"DIA_SylvioDJG_HelloAgain_09_00"); //¡Caramba! Buscas dinero, ¿eh? ¡Lo sabía! Tienes alma de mercenario.
		AI_Output			(self, other,"DIA_SylvioDJG_HelloAgain_09_01"); //Mira, si crees que puedes ganar una fortuna aquí, estás muy equivocado. Yo llegue antes.
	}
	else if (other.guild == GIL_KDF)
	{
		AI_Output			(self, other, "DIA_SylvioDJG_HelloAgain_09_02"); //¡Eh, tú! ¡Los magos me ponen nervioso! ¡Vete por ahí! Aquí no hay nada.
	}
	else
	{
		AI_Output			(self, other, "DIA_SylvioDJG_HelloAgain_09_03"); //¡Eh, tú, paladín! Vuelve a la mina. Aquí no hay nada.
	};
	
	AI_Output			(other, self, "DIA_SylvioDJG_HelloAgain_15_04"); //Lo comprendo. A nadie le gusta separarse de su botín.
	AI_Output			(self, other, "DIA_SylvioDJG_HelloAgain_09_05"); //Tú lo has dicho. Desaparece.
};

///////////////////////////////////////////////////////////////////////
//	Info Versager
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_VERSAGER		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	nr		 = 	6;
	condition	 = 	DIA_Sylvio_VERSAGER_Condition;
	information	 = 	DIA_Sylvio_VERSAGER_Info;

	description	 = 	"¿Y qué si no me voy?";
};

func int DIA_Sylvio_VERSAGER_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_SylvioDJG_HelloAgain))
		&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Sylvio_VERSAGER_Info ()
{
	AI_Output			(other, self, "DIA_Sylvio_VERSAGER_15_00"); //¿Y qué si no me voy?
	AI_Output			(self, other, "DIA_Sylvio_VERSAGER_09_01"); //Mequetrefe, si te pones gallito vas a acabar como esos cerdos: muertos y tumbados en la nieve.
};


///////////////////////////////////////////////////////////////////////
//	Info DeineLeute
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_DEINELEUTE		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	nr		 = 	7;
	condition	 = 	DIA_Sylvio_DEINELEUTE_Condition;
	information	 = 	DIA_Sylvio_DEINELEUTE_Info;

	description	 = 	"¿Eran tus hombres?";
};

func int DIA_Sylvio_DEINELEUTE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Sylvio_VERSAGER))
		&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE)
		&& (MIS_DJG_Sylvio_KillIceGolem == 0)
		{
				return TRUE;
		};
};

func void DIA_Sylvio_DEINELEUTE_Info ()
{
	AI_Output			(other, self, "DIA_Sylvio_DEINELEUTE_15_00"); //¿Eran tus hombres?
	AI_Output			(self, other, "DIA_Sylvio_DEINELEUTE_09_01"); //Ya no. No son una gran pérdida. Esos idiotas no eran muy útiles.
};


///////////////////////////////////////////////////////////////////////
//	Info WasIstPassiert
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_WASISTPASSIERT		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	nr		 = 	8;
	condition	 = 	DIA_Sylvio_WASISTPASSIERT_Condition;
	information	 = 	DIA_Sylvio_WASISTPASSIERT_Info;

	description	 = 	"¿Qué les ha pasado?";
};

func int DIA_Sylvio_WASISTPASSIERT_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Sylvio_VERSAGER))
		&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Sylvio_WASISTPASSIERT_Info ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASISTPASSIERT_15_00"); //¿Qué les ha pasado?
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_09_01"); //No consiguieron que los gigantes de hielo les dejaran pasar y fueron pisoteados.
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_09_02"); //Si eres tan duro, ¿por qué no lo intentas?


	Info_AddChoice	(DIA_Sylvio_WASISTPASSIERT, "De acuerdo. ¿Por qué no?", DIA_Sylvio_WASISTPASSIERT_ok );
	Info_AddChoice	(DIA_Sylvio_WASISTPASSIERT, "¿De qué te serviría que lo hiciera?", DIA_Sylvio_WASISTPASSIERT_washastdudavon );
	Info_AddChoice	(DIA_Sylvio_WASISTPASSIERT, "¿Qué obtengo yo a cambio?", DIA_Sylvio_WASISTPASSIERT_warum );
	Info_AddChoice	(DIA_Sylvio_WASISTPASSIERT, "¿Por qué no te libras de ellos?", DIA_Sylvio_WASISTPASSIERT_selbst );

	Log_CreateTopic (TOPIC_SylvioKillIceGolem, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SylvioKillIceGolem, LOG_RUNNING);
	B_LogEntry (TOPIC_SylvioKillIceGolem,"Sylvio tiene miedo de dos gólems de hielo que están en la entrada de la zona helada del Valle de las Minas."); 

	MIS_DJG_Sylvio_KillIceGolem = LOG_RUNNING;
};
func void DIA_Sylvio_WASISTPASSIERT_selbst ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASISTPASSIERT_selbst_15_00"); //¿Por qué no te libras de ellos?
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_selbst_09_01"); //¡Vamos, vamos! No te des tanto bombo.
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_selbst_09_02"); //En mi opinión, estás cagado de miedo.
	
	Info_AddChoice	(DIA_Sylvio_WASISTPASSIERT, "No voy a prestarme a tus jueguecitos.", DIA_Sylvio_WASISTPASSIERT_keinInteresse );

};
var int DJG_Sylvio_PromisedMoney;
func void DIA_Sylvio_WASISTPASSIERT_warum ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASISTPASSIERT_warum_15_00"); //¿Y qué gano yo?
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_warum_09_01"); //No sé. Por ejemplo... 1000 monedas de oro. ¿Qué te parece?

	DJG_Sylvio_PromisedMoney = TRUE;
};

func void DIA_Sylvio_WASISTPASSIERT_washastdudavon ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASISTPASSIERT_washastdudavon_15_00"); //¿De qué te serviría que lo hiciera?
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_01"); //A ti te da lo mismo, pero respondiendo a tu pregunta, quiero ir a la región helada.
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_02"); //Por desgracia, esas malditas criaturas se interponen.
	
	Info_AddChoice	(DIA_Sylvio_WASISTPASSIERT, "¿Qué quieres hacer en la región helada?", DIA_Sylvio_WASISTPASSIERT_Eisregion );

};

func void DIA_Sylvio_WASISTPASSIERT_keinInteresse ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_15_00"); //No voy a prestarme a tus jueguecitos.
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_09_01"); //¡Ah! Entonces fuera de aquí, cobarde.

	AI_StopProcessInfos	(self);
};

func void DIA_Sylvio_WASISTPASSIERT_Eisregion ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_15_00"); //¿Qué quieres hacer en la región helada?
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_01"); //No paras de preguntar, ¿eh? Muy bien, te lo contaré.
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_02"); //Jamás has visto un yermo helado como el que hay aquí, detrás de estos riscos.
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_03"); //En el enorme tesoro de un dragón de hielo hay escondida una joya.
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_04"); //La quiero. ¿Qué dices? ¿Sí o no?
};
func void DIA_Sylvio_WASISTPASSIERT_ok ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASISTPASSIERT_ok_15_00"); //De acuerdo. ¿Por qué no?
	AI_Output			(self, other, "DIA_Sylvio_WASISTPASSIERT_ok_09_01"); //Entonces date prisa. No tengo todo el día.

	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info IceGolemsKilled
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_ICEGOLEMSKILLED		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	nr		 = 	9;
	condition	 = 	DIA_Sylvio_ICEGOLEMSKILLED_Condition;
	information	 = 	DIA_Sylvio_ICEGOLEMSKILLED_Info;

	description	 = 	"¡Tienes el camino despejado!";
};

func int DIA_Sylvio_ICEGOLEMSKILLED_Condition ()
{
	if 	(Npc_IsDead(IceGolem_Sylvio1))
		&& (Npc_IsDead(IceGolem_Sylvio2))
		&& (MIS_DJG_Sylvio_KillIceGolem  == LOG_RUNNING)
		&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE)
			{
					return TRUE;
			};
};

func void DIA_Sylvio_ICEGOLEMSKILLED_Info ()
{
	AI_Output			(other, self, "DIA_Sylvio_ICEGOLEMSKILLED_15_00"); //¡Tienes el camino despejado! Los gigantes de hielo han muerto.
	AI_Output			(self, other, "DIA_Sylvio_ICEGOLEMSKILLED_09_01"); //Buen trabajo. A ver lo que tenemos.

	if (DJG_Sylvio_PromisedMoney  == TRUE)
	{
	AI_Output			(other, self, "DIA_Sylvio_ICEGOLEMSKILLED_15_02"); //Un momento. ¿Qué hay del dinero?
	AI_Output			(self, other, "DIA_Sylvio_ICEGOLEMSKILLED_09_03"); //Todo a su tiempo.
	};

	AI_StopProcessInfos	(self);

	MIS_DJG_Sylvio_KillIceGolem = LOG_SUCCESS;
	B_GivePlayerXP (XP_SylvioDJGIceGolemDead);
	Npc_ExchangeRoutine	(self,		"IceWait1");
	B_StartotherRoutine (DJG_Bullco,"IceWait1");	
};


///////////////////////////////////////////////////////////////////////
//	Info Wasjetzt
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_WASJETZT		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	nr		 = 	10;
	condition	 = 	DIA_Sylvio_WASJETZT_Condition;
	information	 = 	DIA_Sylvio_WASJETZT_Info;

	description	 = 	"¿Y ahora qué?";
};

func int DIA_Sylvio_WASJETZT_Condition ()
{
	if 	(MIS_DJG_Sylvio_KillIceGolem  == LOG_SUCCESS)
		&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE)
			{
					return TRUE;
			};
};

func void DIA_Sylvio_WASJETZT_Info ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASJETZT_15_00"); //¿Y ahora qué?
	AI_Output			(self, other, "DIA_Sylvio_WASJETZT_09_01"); //Vaya. Yo diría que tiene muy mala pinta.
	AI_Output			(self, other, "DIA_Sylvio_WASJETZT_09_02"); //Lo mejor es que te adelantes y que yo te siga.

	Info_AddChoice	(DIA_Sylvio_WASJETZT, "De acuerdo.", DIA_Sylvio_WASJETZT_ok );
	Info_AddChoice	(DIA_Sylvio_WASJETZT, "¿Tienes miedo?", DIA_Sylvio_WASJETZT_trennen );
	Info_AddChoice	(DIA_Sylvio_WASJETZT, "No voy a hacerte todo el trabajo sucio.", DIA_Sylvio_WASJETZT_nein );
	if (DJG_Sylvio_PromisedMoney  == TRUE)
	{
	Info_AddChoice	(DIA_Sylvio_WASJETZT, "Antes quiero ver mi dinero.", DIA_Sylvio_WASJETZT_Geld );
	};
};
func void DIA_Sylvio_WASJETZT_trennen ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASJETZT_trennen_15_00"); //¿Tienes miedo?
	AI_Output			(self, other, "DIA_Sylvio_WASJETZT_trennen_09_01"); //No digas tonterías. Ponte en marcha.

};

func void DIA_Sylvio_WASJETZT_ok ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASJETZT_ok_15_00"); //De acuerdo.
	AI_Output			(self, other, "DIA_Sylvio_WASJETZT_ok_09_01"); //Venga, salta a por él.

	AI_StopProcessInfos	(self);
};

func void DIA_Sylvio_WASJETZT_nein ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASJETZT_nein_15_00"); //No voy a hacerte todo el trabajo sucio.
	AI_Output			(self, other, "DIA_Sylvio_WASJETZT_nein_09_01"); //¡Cobarde!

	AI_StopProcessInfos	(self);
};

func void DIA_Sylvio_WASJETZT_Geld ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASJETZT_Geld_15_00"); //Antes quiero ver mi dinero.
	AI_Output			(self, other, "DIA_Sylvio_WASJETZT_Geld_09_01"); //En cuanto nos carguemos al dragón, tendrás todo el oro que puedas llevarte.

	Info_AddChoice	(DIA_Sylvio_WASJETZT, "Quiero mi dinero ahora mismo.", DIA_Sylvio_WASJETZT_jetztGeld );
};

func void DIA_Sylvio_WASJETZT_jetztGeld ()
{
	AI_Output			(other, self, "DIA_Sylvio_WASJETZT_jetztGeld_15_00"); //Quiero mi dinero ahora mismo.
	AI_Output			(self, other, "DIA_Sylvio_WASJETZT_jetztGeld_09_01"); //Ve tú delante, o te las verás conmigo.
};

///////////////////////////////////////////////////////////////////////
//	Info Kommstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_KOMMSTDU		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	nr		 = 	11;
	condition	 = 	DIA_Sylvio_KOMMSTDU_Condition;
	information	 = 	DIA_Sylvio_KOMMSTDU_Info;
	permanent	 = 	TRUE;

	description	 = 	"Pensaba que ibas a la región helada.";
};

func int DIA_Sylvio_KOMMSTDU_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Sylvio_WASJETZT))
		&& (IceDragon.aivar[AIV_TalkedToPlayer] == FALSE)
			{
					return TRUE;
			};
};

func void DIA_Sylvio_KOMMSTDU_Info ()
{
	AI_Output			(other, self, "DIA_Sylvio_KOMMSTDU_15_00"); //Pensaba que ibas a la región helada.
	AI_Output			(self, other, "DIA_Sylvio_KOMMSTDU_09_01"); //Ve tú delante. Yo te sigo.

	AI_StopProcessInfos	(self);	 
};

///////////////////////////////////////////////////////////////////////
//	Info DuHier
///////////////////////////////////////////////////////////////////////
instance DIA_Sylvio_DUHIER		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	nr		 = 	11;
	condition	 = 	DIA_Sylvio_DUHIER_Condition;
	information	 = 	DIA_Sylvio_DUHIER_Info;
	permanent	 = 	TRUE;

	description	 = 	"Me vendría bien algo de ayuda.";
};

func int DIA_Sylvio_DUHIER_Condition ()
{
	if 	((Npc_IsDead(IceDragon)) == FALSE)
		&& (IceDragon.aivar[AIV_TalkedToPlayer] == TRUE)
			{
					return TRUE;
			};
};

func void DIA_Sylvio_DUHIER_Info ()
{
	AI_Output			(other, self, "DIA_Sylvio_DUHIER_15_00"); //Me vendría bien algo de ayuda.
	AI_Output			(self, other, "DIA_Sylvio_DUHIER_09_01"); //Tonterías. Lo estás haciendo genial.
	
	AI_StopProcessInfos	(self);	 
};

///////////////////////////////////////////////////////////////////////
//	Info WhatNext
///////////////////////////////////////////////////////////////////////
instance DIA_SylvioDJG_WHATNEXT		(C_INFO)
{
	npc		     = 	DJG_700_Sylvio;
	nr		 = 	12;
	condition	 = 	DIA_SylvioDJG_WHATNEXT_Condition;
	information	 = 	DIA_SylvioDJG_WHATNEXT_Info;
	important	 = 	TRUE;
};

func int DIA_SylvioDJG_WHATNEXT_Condition ()
{
	if 	(Npc_IsDead(IceDragon))		
		{
			return TRUE;
		};
};

func void DIA_SylvioDJG_WHATNEXT_Info ()
{
	AI_Output	(self, other, "DIA_SylvioDJG_WHATNEXT_09_00"); //¡El dragón de hielo está muerto! Dame ya todo lo que llevas encima.
	AI_Output	(other, self, "DIA_SylvioDJG_WHATNEXT_15_01"); //¡Ni hablar!
	AI_Output	(self, other, "DIA_SylvioDJG_WHATNEXT_09_02"); //Soy yo quien va a ser famoso por matar al dragón de hielo.
	AI_Output	(self, other, "DIA_SylvioDJG_WHATNEXT_09_03"); //¡Se acabó lo poco que pintabas en este asunto!

	TOPIC_END_SylvioKillIceGolem = TRUE;
	B_GivePlayerXP (XP_Ambient);
	Info_ClearChoices	(DIA_SylvioDJG_WHATNEXT);
	Info_AddChoice	(DIA_SylvioDJG_WHATNEXT, DIALOG_ENDE, DIA_SylvioDJG_WHATNEXT_ATTACK );
};
func void DIA_SylvioDJG_WHATNEXT_ATTACK ()
{
	AI_StopProcessInfos	(self);
	Npc_SetRefuseTalk (self,60);

	Npc_ExchangeRoutine (self,	"Start");
	B_StartOtherRoutine (DJG_Bullco,"Start");

	B_LogEntry (TOPIC_Dragonhunter,"El cerdo de Sylvio intentaba apuntarse el tanto de mi victoria sobre los dragones de hielo. Ha habido más que palabras."); 

	B_Attack (self, other, AR_NONE, 1);	
	B_Attack (DJG_Bullco, other, AR_NONE, 1);	
};

///////////////////////////////////////////////////////////////////////
//	Info ButNow
///////////////////////////////////////////////////////////////////////
instance DIA_SylvioDJG_BUTNOW		(C_INFO)
{
	npc		     = 	DJG_700_Sylvio;
	nr		 = 	13;
	condition	 = 	DIA_SylvioDJG_BUTNOW_Condition;
	information	 = 	DIA_SylvioDJG_BUTNOW_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_SylvioDJG_BUTNOW_Condition ()
{
	if 	(Npc_IsDead(IceDragon))
		&& (Npc_RefuseTalk(self) == FALSE)
		&& (Npc_KnowsInfo(other, DIA_SylvioDJG_WHATNEXT))
			{
				return TRUE;
			};
};

func void DIA_SylvioDJG_BUTNOW_Info ()
{
	AI_Output	(self, other, "DIA_SylvioDJG_BUTNOW_09_00"); //Es hora de ajustar cuentas.
	
	AI_StopProcessInfos	(self);

	Npc_SetRefuseTalk (self,60);

	B_Attack (self, other, AR_NONE, 1);	
	B_Attack (DJG_Bullco, other, AR_NONE, 1);	
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Sylvio_PICKPOCKET (C_INFO)
{
	npc			= DJG_700_Sylvio;
	nr			= 900;
	condition	= DIA_Sylvio_PICKPOCKET_Condition;
	information	= DIA_Sylvio_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Sylvio_PICKPOCKET_Condition()
{
	C_Beklauen (78, 560);
};
 
FUNC VOID DIA_Sylvio_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Sylvio_PICKPOCKET);
	Info_AddChoice		(DIA_Sylvio_PICKPOCKET, DIALOG_BACK 		,DIA_Sylvio_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Sylvio_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Sylvio_PICKPOCKET_DoIt);
};

func void DIA_Sylvio_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Sylvio_PICKPOCKET);
};
	
func void DIA_Sylvio_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Sylvio_PICKPOCKET);
};






























	/*	

///////////////////////////////////////////////////////////////////////
//	Info AngebotMachen
///////////////////////////////////////////////////////////////////////
instance DIA_SylvioDJG_ANGEBOTMACHEN		(C_INFO)
{
	npc		 = 	DJG_700_Sylvio;
	condition	 = 	DIA_SylvioDJG_ANGEBOTMACHEN_Condition;
	information	 = 	DIA_SylvioDJG_ANGEBOTMACHEN_Info;



	description	 = 	"Ich brauche eure Hilfe in der Eisregion!";
};

func int DIA_SylvioDJG_ANGEBOTMACHEN_Condition ()
{
	if (
	(Npc_KnowsInfo(other, DIA_SylvioDJG_HelloAgain))
	&& ((Npc_IsDead(IceDragon))== FALSE)
	)
	{
	return TRUE;
	};
};

func void DIA_SylvioDJG_ANGEBOTMACHEN_Info ()
{
	AI_Output			(other, self, "DIA_SylvioDJG_ANGEBOTMACHEN_15_00"); //Paß auf, ich mach euch ein Angebot.
	AI_Output			(self, other, "DIA_SylvioDJG_ANGEBOTMACHEN_09_01"); //Na, dann laß mal hören.
	AI_Output			(other, self, "DIA_SylvioDJG_ANGEBOTMACHEN_15_02"); //Ihr hockt garantiert nicht zufällig hier vor der Eisregion da drüben. Ihr spielt mit dem Gedanken da rein zu gehen und euch die Beute dahinter zu schnappen.
	AI_Output			(self, other, "DIA_SylvioDJG_ANGEBOTMACHEN_09_03"); //Und wenn es so wäre?
	AI_Output			(other, self, "DIA_SylvioDJG_ANGEBOTMACHEN_15_04"); //Wir könnten gemeinsam hinein gehen!
	AI_Output			(self, other, "DIA_SylvioDJG_ANGEBOTMACHEN_09_05"); //Warum denkst du sollten WIR das tun?
	AI_Output			(other, self, "DIA_SylvioDJG_ANGEBOTMACHEN_15_06"); //Mich interssieren die Schätze nicht, die sich dahinter verbergen. Was es da zu holen gibt, könnt ihr meinet wegen behalten.
	AI_Output			(self, other, "DIA_SylvioDJG_ANGEBOTMACHEN_09_07"); //Mmh!
	AI_Output			(other, self, "DIA_SylvioDJG_ANGEBOTMACHEN_15_08"); //Ihr seid zwar gut, aber mit drei Mann sind wir schneller wieder raus.
	AI_Output			(self, other, "DIA_SylvioDJG_ANGEBOTMACHEN_09_09"); //Bilde dir aber nicht ein, daß du uns übers Ohr hauen kannst! Ausserdem ist der Eisdrache nicht von schlechten Eltern. Wir kriegen alles, sagst du?
	AI_Output			(other, self, "DIA_SylvioDJG_ANGEBOTMACHEN_15_10"); //Genau! Jetzt, wo ich weiß, daß es um einen Drachen geht...
	AI_Output			(self, other, "DIA_SylvioDJG_ANGEBOTMACHEN_09_11"); //Verdammt! Na schön, von mir aus! Sag bescheid, wenn du bereit bist!

	Log_AddEntry (TOPIC_Dragonhunter,"Sylvio vermutet einen Drachen in der Eisregion."); 
};


//---------------------------------------------------------------------
//	Info WAIT
//---------------------------------------------------------------------
INSTANCE DIA_SylvioDJG_WAIT (C_INFO)
{
	npc			= DJG_700_Sylvio;
	condition	= DIA_SylvioDJG_WAIT_Condition;
	information	= DIA_SylvioDJG_WAIT_Info;
	important	= 0;	
	permanent	= 1;
	description	= "Warte mal einen Moment!";
};                       

FUNC INT DIA_SylvioDJG_WAIT_Condition()
{
	if	(
		(self.aivar[AIV_PARTYMEMBER] == TRUE)
		&& ((Npc_IsDead(IceDragon))== FALSE)
		)
	{
		return TRUE;
	};
};

func VOID DIA_SylvioDJG_WAIT_Info()
{
	AI_Output 			(other,self,"DIA_SylvioDJG_WAIT_15_00"); //Warte mal einen Moment!
	AI_Output 			(self,other,"DIA_SylvioDJG_WAIT_09_01"); //Was ist denn? Geh´ gefälligst weiter!
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info IceWait1
//---------------------------------------------------------------------
INSTANCE DIA_SylvioDJG_IceWait1 (C_INFO)
{
	npc			= DJG_700_Sylvio;
	condition	= DIA_SylvioDJG_IceWait1_Condition;
	information	= DIA_SylvioDJG_IceWait1_Info;
	important	= 0;	
	permanent	= 0;
	description	= "Ich bin soweit!";
};                       

FUNC INT DIA_SylvioDJG_IceWait1_Condition()
{
	if	((self.aivar[AIV_PARTYMEMBER] == FALSE) 
		&& (Npc_KnowsInfo(other, DIA_SylvioDJG_ANGEBOTMACHEN))
		&& ((Npc_IsDead(IceDragon))== FALSE)
		 )
	{
		return TRUE;
	};
};

func VOID DIA_SylvioDJG_IceWait1_Info()
{
	AI_Output 			(other,self,"DIA_SylvioDJG_IceWait1_15_00"); //Ich bin soweit! Laß uns losgehen!
	AI_Output 			(self,other,"DIA_SylvioDJG_IceWait1_09_01"); //Dann werden wir ja sehen, wie gut du bist.
	Info_AddChoice		(DIA_SylvioDJG_IceWait1, "losgehen", DIA_SylvioDJG_IceWait1_losgehen );


};
func void DIA_SylvioDJG_IceWait1_losgehen ()
{
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_Bullco.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self,		"IceWait1");

	if 	((Hlp_IsValidNpc (DJG_Bullco))
		&& (!Npc_IsDead (DJG_Bullco)))
		{
			Npc_ExchangeRoutine	(DJG_Bullco,"IceWait1");
			AI_ContinueRoutine (DJG_Bullco);
		};
};




//***************************************************************************
//	Info IceWait2
//***************************************************************************
INSTANCE DIA_SylvioDJG_IceWait2 (C_INFO)
{
	npc			= DJG_700_Sylvio;
	condition	= DIA_SylvioDJG_IceWait2_Condition;
	information	= DIA_SylvioDJG_IceWait2_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT DIA_SylvioDJG_IceWait2_Condition()
{
	if (
		(Npc_GetDistToWP(self,"OW_DJG_ICEREGION_WAIT1_01")<1000) 				
		&& ((Npc_IsDead(IceDragon))== FALSE)
		)
	{
		return TRUE;
	};
};

func VOID DIA_SylvioDJG_IceWait2_Info()
{
	AI_GotoNpc	(self,	other);

	AI_Output (self, other,"DIA_SylvioDJG_IceWait2_09_00"); //So! Die erste Ebene scheint nun sicher!
	AI_Output (other, self,"DIA_SylvioDJG_IceWait2_15_01"); //Geh weiter!
	AI_Output (self, other,"DIA_SylvioDJG_IceWait2_09_02"); //Hör dir das an! Der Kleine, kriegt wohl nicht genug, was? 
	Info_AddChoice	(DIA_SylvioDJG_IceWait2, DIALOG_ENDE, DIA_SylvioDJG_IceWait2_weiter );
};

func void DIA_SylvioDJG_IceWait2_weiter ()
{
	AI_Output (self, other,"DIA_SylvioDJG_IceWait2Weiter_09_00"); //Na dann komm!

	AI_StopProcessInfos	(self);

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_Bullco.aivar[AIV_PARTYMEMBER] = TRUE;

	Npc_ExchangeRoutine	(self,		"IceWait2");

	if 	((Hlp_IsValidNpc (DJG_Bullco))
		&& (!Npc_IsDead (DJG_Bullco)))
		{
			Npc_ExchangeRoutine	(DJG_Bullco,"IceWait2");
			AI_ContinueRoutine (DJG_Bullco);
		};
};

	



//***************************************************************************
//	Info GoForIceDragon
//***************************************************************************
INSTANCE DIA_SylvioDJG_GoForIceDragon (C_INFO)
{
	npc			= DJG_700_Sylvio;
	condition	= DIA_SylvioDJG_GoForIceDragon_Condition;
	information	= DIA_SylvioDJG_GoForIceDragon_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT DIA_SylvioDJG_GoForIceDragon_Condition()
{
	if (
	(Npc_GetDistToWP(self,"OW_DJG_ICEREGION_WAIT2_01")<1000) 
	&& ((Npc_IsDead(IceDragon))== FALSE)
	)
	{
		return TRUE;
	};
};

func VOID DIA_SylvioDJG_GoForIceDragon_Info()
{
	AI_GotoNpc	(self,	other);

	AI_Output 	(self, other,"DIA_SylvioDJG_GoForIceDragon_09_00"); //So. Jetzt heißt, es dem Drachen das Handwerk zu legen. Was du machst? Ist mit ehrlich gesagt egal!
	AI_Output	(other, self,"DIA_SylvioDJG_GoForIceDragon_15_01"); //Ich warne dich, Sylvio, verarsch mich jetzt nicht!
	AI_Output 	(self, other,"DIA_SylvioDJG_GoForIceDragon_09_02"); //Bis hierhin warst du eine...na ja...sagen wir...Hilfe. Aber jetzt, da wir an den ganzen Golemfeldern vorbei sind, überlass die Hauptarbeit mal lieber einem Profi. Sonst passiert dir noch was.
	AI_Output	(other, self,"DIA_SylvioDJG_GoForIceDragon_15_03"); //Keine Chance!
	AI_Output	(self, other,"DIA_SylvioDJG_GoForIceDragon_09_04"); //Na gut! Wenn du nicht anders willst. Aber beschwer dich nachher nicht ich hätte...
	AI_Output	(other, self,"DIA_SylvioDJG_GoForIceDragon_15_05"); //Halt endlich die Klappe!

	Log_AddEntry (TOPIC_Dragonhunter,"Sylvio wollte mich erst los werden, nachdem wir die Icegolemebene hinter uns gelassen hatten. Schließlich griffen wir dann doch gemeinsam den Eisdrachen an."); 
	
	B_GivePlayerXP (XP_SylvioDJGIceClear);
	
	Info_AddChoice	(DIA_SylvioDJG_GoForIceDragon, "weiter gehen", DIA_SylvioDJG_GoForIceDragon_weitergehen );
};

func void DIA_SylvioDJG_GoForIceDragon_weitergehen ()
{
	AI_Output	(self, other, "DIA_SylvioDJG_GoForIceDragon_weitergehen_09_00"); //Los, weiter!

	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self,	"IceDragon");

	if 	((Hlp_IsValidNpc (DJG_Bullco))
		&& (!Npc_IsDead (DJG_Bullco)))
		{
			Npc_ExchangeRoutine	(DJG_Bullco,"IceDragon");
			AI_ContinueRoutine (DJG_Bullco);
		};

	self.flags =0;
	DJG_Bullco.flags =0;

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_Bullco.aivar[AIV_PARTYMEMBER] = FALSE;
};



///////////////////////////////////////////////////////////////////////
//	Info WhatNext
///////////////////////////////////////////////////////////////////////
instance DIA_SylvioDJG_WHATNEXT		(C_INFO)
{
	npc		     = 	DJG_700_Sylvio;
	condition	 = 	DIA_SylvioDJG_WHATNEXT_Condition;
	information	 = 	DIA_SylvioDJG_WHATNEXT_Info;
	important	 = 	TRUE;


};

func int DIA_SylvioDJG_WHATNEXT_Condition ()
{
	if (
		((Npc_IsDead(IceDragon))== TRUE)	
		)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_WHATNEXT_Info ()
{
	AI_Output	(self, other, "DIA_SylvioDJG_WHATNEXT_09_00"); //Der Eisdrache ist tot! Und du gibst mir jetzt alles, was du bei dir hast!
	AI_Output	(other, self, "DIA_SylvioDJG_WHATNEXT_15_01"); //Was ist los? Ich denke ja gar nicht daran!	
	AI_Output	(self, other, "DIA_SylvioDJG_WHATNEXT_09_02"); //Ich werde derjenige sein, der als Eisdrachentöter gefeiert wird. Deine kleine Rolle bei der Sache, wird jetzt aus der Welt geschafft!
	
	AI_StopProcessInfos	(self);
	
	self.flags =0;
	DJG_Bullco.flags =0;

	Log_AddEntry (TOPIC_Dragonhunter,"Das dreckige Schwein Sylvio wollte mir den Sieg über den Eisdrachen steitig machen. Es gab eine kleine Auseinandersetzung."); 

	B_Attack (self, other, AR_NONE, 1);	
	B_Attack (DJG_Bullco, other, AR_NONE, 1);	
	
	Npc_ExchangeRoutine (self,	"Start");

	if 	((Hlp_IsValidNpc (DJG_Bullco))
		&& (!Npc_IsDead (DJG_Bullco)))
		{
			Npc_ExchangeRoutine	(DJG_Bullco,"Start");
			AI_ContinueRoutine (DJG_Bullco);
		};
};


	*/	









