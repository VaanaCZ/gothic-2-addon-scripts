// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Raoul_EXIT(C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 999;
	condition	= DIA_Raoul_EXIT_Condition;
	information	= DIA_Raoul_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Raoul_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Raoul_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				NoSentenza
// ************************************************************
instance DIA_Raoul_NoSentenza (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 1;
	condition	= DIA_Raoul_NoSentenza_Condition;
	information	= DIA_Raoul_NoSentenza_Info;
	permanent	= FALSE;
	important 	= TRUE; 
};                       

FUNC INT DIA_Raoul_NoSentenza_Condition()
{
	if (!Npc_KnowsInfo(other, DIA_Sentenza_Hello))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_NoSentenza_Info()
{	
	AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_00"); //¡Espera un momento, compañero!
	AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_01"); //No he visto que Sentenza te registre.
	
	if (Hlp_IsValidNpc(Sentenza))
	&& (!C_NpcIsDown(Sentenza))
	{
		AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_02"); //¡SENTENZA! ¡Ven aquí!
		AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_03"); //(Artificialmente educado) Un momento, ¡ahora viene!
		AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_04"); //¡Te vas a llevar una buena sorpresa!
		
		B_Attack (Sentenza, other, AR_NONE, 0);
	}
	else 
	{
		AI_Output (self ,other,"DIA_Raoul_NoSentenza_01_05"); //De todas maneras, ¿dónde está? Bueno, no importa, has tenido suerte...
	};
	
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				Hello
// ************************************************************
instance DIA_Raoul_Hello (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 1;
	condition	= DIA_Raoul_Hello_Condition;
	information	= DIA_Raoul_Hello_Info;
	permanent	= TRUE;
	important 	= TRUE; 
};                       

FUNC INT DIA_Raoul_Hello_Condition()
{
	if (other.guild == GIL_NONE)
	&& (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_Hello_Info()
{	
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self ,other,"DIA_Raoul_Hello_01_00"); //(Aburrido) ¿Qué es lo que quieres?
	}
	else
	{
		AI_Output (self ,other,"DIA_Raoul_Hello_01_01"); //(Molesto) ¿Qué quieres ahora?
	};
};

// ************************************************************
// 			  				PERM (Gil_None)
// ************************************************************

var int Raoul_gesagt;
// -------------------------
instance DIA_Raoul_PERMNone (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 1;
	condition	= DIA_Raoul_PERMNone_Condition;
	information	= DIA_Raoul_PERMNone_Info;
	permanent	= TRUE;
	description = "¡Quiero echar un vistazo a la granja!"; 
};                       

FUNC INT DIA_Raoul_PERMNone_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_PERMNone_Info()
{
	AI_Output (other, self, "DIA_Raoul_PERMNone_15_00"); //¡Quiero echar un vistazo a la granja!
	
	if (Raoul_gesagt == FALSE)
	{
		AI_Output (self, other, "DIA_Raoul_PERMNone_01_01"); //No entres en el edificio de la izquierda. Ahí está Sylvio y no está de buen humor.
		AI_Output (self, other, "DIA_Raoul_PERMNone_01_02"); //Si ve a un debilucho que no es de la granja, se le puede ocurrir pagarla con él.
		Raoul_gesagt = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Raoul_PERMNone_01_03"); //¡Que te diviertas!
		AI_StopProcessInfos (self);
	};
};

// ************************************************************
// 			  				Wanna Join
// ************************************************************
instance DIA_Raoul_WannaJoin (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 2;
	condition	= DIA_Raoul_WannaJoin_Condition;
	information	= DIA_Raoul_WannaJoin_Info;
	permanent	= FALSE;
	description = "¡Me quiero unir a Lee!"; 
};                       

FUNC INT DIA_Raoul_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Raoul_WannaJoin_15_00"); //¡Me quiero unir a Lee!
	AI_Output (self, other, "DIA_Raoul_WannaJoin_01_01"); //¡Si Lee sigue por este camino, su palabra no va a tener mucho peso!
	AI_Output (other, self, "DIA_Raoul_WannaJoin_15_02"); //¿Qué quieres decir?
	AI_Output (self, other, "DIA_Raoul_WannaJoin_01_03"); //Quiere que nos quedemos cruzados de brazos y nos toquemos las narices. Que intimidemos a unos cuantos granjeros de vez en cuando, y ya está.
	AI_Output (self, other, "DIA_Raoul_WannaJoin_01_04"); //Sylvio dice que la mejor defensa es un buen ataque. Y tiene mucha razón.
};
	
// ************************************************************
// 			  				AboutSylvio
// ************************************************************
instance DIA_Raoul_AboutSylvio (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 2;
	condition	= DIA_Raoul_AboutSylvio_Condition;
	information	= DIA_Raoul_AboutSylvio_Info;
	permanent	= FALSE;
	description = "¿Quién es Sylvio?"; 
};                       

FUNC INT DIA_Raoul_AboutSylvio_Condition()
{
	if (Raoul_gesagt == TRUE)
	|| (Npc_KnowsInfo (other, DIA_Raoul_WannaJoin))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_AboutSylvio_Info()
{	
	AI_Output (other, self, "DIA_Raoul_AboutSylvio_15_00"); //¿Quién es Sylvio?
	AI_Output (self, other, "DIA_Raoul_AboutSylvio_01_01"); //Nuestro próximo líder, en mi opinión. Si piensas en pedirle que te deje unirte a nosotros, ¡olvídalo!
	AI_Output (self, other, "DIA_Raoul_AboutSylvio_01_02"); //Ni siquiera tienes pinta de ser buen pastor de ovejas.
};

// ************************************************************
// 			  				Stimme
// ************************************************************
instance DIA_Raoul_Stimme (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 2;
	condition	= DIA_Raoul_Stimme_Condition;
	information	= DIA_Raoul_Stimme_Info;
	permanent	= FALSE;
	description = "Me gustaría hacerme mercenario. ¿Te importa?"; 
};                       

FUNC INT DIA_Raoul_Stimme_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_Stimme_Info()
{	
	AI_Output (other, self, "DIA_Raoul_Stimme_15_00"); //Me gustaría hacerme mercenario. ¿Te importa?
	AI_Output (self, other, "DIA_Raoul_Stimme_01_01"); //Aah, haz lo que quieras...
	
	Log_CreateTopic (TOPIC_SLDRespekt,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_SLDRespekt,LOG_RUNNING);
	B_LogEntry (TOPIC_SLDRespekt,"A Raoul no le importa que me una a los mercenarios.");
};

// ************************************************************
// 			  					Duell
// ************************************************************
instance DIA_Raoul_Duell (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 2;
	condition	= DIA_Raoul_Duell_Condition;
	information	= DIA_Raoul_Duell_Info;
	permanent	= TRUE;
	description = "Me parece que te voy a partir la cara..."; 
};                       

FUNC INT DIA_Raoul_Duell_Condition()
{
	if (Raoul_gesagt == TRUE)
	|| (Npc_KnowsInfo (other, DIA_Raoul_AboutSylvio))
	|| (Npc_KnowsInfo (other, DIA_Jarvis_MissionKO))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Raoul_Duell_Info()
{	
	AI_Output (other, self, "DIA_Raoul_Duell_15_00"); //Me parece que te voy a partir la cara...
	AI_Output (self, other, "DIA_Raoul_Duell_01_01"); //¿Qué?
	AI_Output (other, self, "DIA_Raoul_Duell_15_02"); //Eso es exactamente lo que te hace falta...
	AI_Output (self, other, "DIA_Raoul_Duell_01_03"); //Hasta ahora he sido muy simpático contigo ¿no?
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE, 1);
};

//#####################################################################

//							Mit erster Gilde

//#####################################################################

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_PERM		(C_INFO)
{
	npc		 	= Sld_822_Raoul;
	nr		 	= 900;
	condition	= DIA_Raoul_PERM_Condition;
	information	= DIA_Raoul_PERM_Info;
	permanent	= TRUE;
	description	= "¿Va bien todo lo demás?";
};

func int DIA_Raoul_PERM_Condition ()
{
	if (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Raoul_PERM_15_00"); //¿Va bien todo lo demás?

	if (MIS_Raoul_KillTrollBlack == LOG_RUNNING)
	{
		AI_Output			(self, other, "DIA_Raoul_PERM_01_01"); //No cacarees tanto. Ve a traerme esa piel de troll negro.
	}
	else 
	{
		AI_Output			(self, other, "DIA_Raoul_PERM_01_02"); //¿Ahora quieres ponerte a buenas conmigo o qué? ¡Lárgate!

		 if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output			(self, other, "DIA_Raoul_PERM_01_03"); //No he olvidado lo que me hiciste.
		};
	};
};


///////////////////////////////////////////////////////////////////////
//	Info Troll
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_TROLL		(C_INFO)
{
	npc		 = 	Sld_822_Raoul;
	nr		 = 	2;
	condition	 = 	DIA_Raoul_TROLL_Condition;
	information	 = 	DIA_Raoul_TROLL_Info;
	important	 = 	TRUE;

};

func int DIA_Raoul_TROLL_Condition ()
{
	if (hero.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_TROLL_Info ()
{
	AI_Output			(self, other, "DIA_Raoul_TROLL_01_00"); //(Con cinismo) ¡Mira eso!
	AI_Output			(other, self, "DIA_Raoul_TROLL_15_01"); //¿Qué es lo que quieres?

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Raoul_TROLL_01_02"); //¿Te has unido a los mendigos de la ciudad? Es lo que parece.
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Raoul_TROLL_01_03"); //No creas que te respeto porque seas uno de los nuestros.
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Raoul_TROLL_01_04"); //Juegas a ser un gran mago, ¿eh?
		};
	
	AI_Output			(self, other, "DIA_Raoul_TROLL_01_05"); //Voy a decirte una cosa. Aunque la mona se vista de seda...
	AI_Output			(self, other, "DIA_Raoul_TROLL_01_06"); //Para mí no eres más que un haragán de pacotilla.

	Info_ClearChoices	(DIA_Raoul_TROLL);
	Info_AddChoice	(DIA_Raoul_TROLL, "Tengo cosas que hacer.", DIA_Raoul_TROLL_weg );
	Info_AddChoice	(DIA_Raoul_TROLL, "¿Qué te pasa?", DIA_Raoul_TROLL_rechnung );
};

func void DIA_Raoul_TROLL_weg ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_weg_15_00"); //Tengo que irme.
	AI_Output			(self, other, "DIA_Raoul_TROLL_weg_01_01"); //¡Sí, lárgate!
	AI_StopProcessInfos (self);
};

func void DIA_Raoul_TROLL_rechnung ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_15_00"); //¿Qué te pasa?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_01"); //Conozco a los de tu calaña. Hablan mucho, pero no tienen agallas..
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_02"); //Odio a los que se visten como reyes y no dejan de paveonarse de sus heroicidades.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_03"); //Justo ayer, le partí la boca a uno de los chicos porque aseguraba que podía acabar con un troll negro con una mano atada a la espalda.
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_15_04"); //¿Y qué?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_05"); //(Agriamente) ¿Qué se supone que significa ''y qué''?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_06"); //¿Has visto alguna vez un troll negro, bocazas? ¿Tienes la más remota idea de lo grandes que son esos bichos?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_01_07"); //Si te acercas a uno, te hará pedacitos.

	Info_ClearChoices	(DIA_Raoul_TROLL);
	Info_AddChoice	(DIA_Raoul_TROLL, "No es asunto mío.", DIA_Raoul_TROLL_rechnung_hastrecht );

	if (Npc_IsDead(Troll_Black))
	{
		Info_AddChoice	(DIA_Raoul_TROLL, "Ya he matado a un troll negro.", DIA_Raoul_TROLL_rechnung_ich );
	}
	else
	{
		Info_AddChoice	(DIA_Raoul_TROLL, "¿Un troll negro? No hay problema.", DIA_Raoul_TROLL_rechnung_noProb );
	};
};

func void B_Raoul_Blame ()
{
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_00"); //Lo estás deseando, ¿verdad? Debería arrancarte la cabeza. Pero tengo una idea
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_01"); //Si eres un guerrero tan bueno, demuéstralo.
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_02"); //¿Y qué gano yo?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_03"); //Estúpida pregunta. ¿Tu honor y tu mandíbula intactos?
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_04"); //Eso no es mucho, ¿no?
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_05"); //Mmm. Digamos que te pagaré un montón de dinero si me traes la piel de un troll negro. ¿Cómo suena eso?
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_06"); //Mejor.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_07"); //Entonces, ¿a qué estás esperando?
	
	Log_CreateTopic (TOPIC_KillTrollBlack, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillTrollBlack, LOG_RUNNING);
	B_LogEntry (TOPIC_KillTrollBlack,"Raoul quiere que le lleve la piel de un troll negro."); 
	
	MIS_Raoul_KillTrollBlack = LOG_RUNNING;

	Info_ClearChoices	(DIA_Raoul_TROLL);
};

func void DIA_Raoul_TROLL_rechnung_hastrecht ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_hastrecht_15_00"); //No me interesa.
	AI_Output			(self, other, "DIA_Raoul_TROLL_rechnung_hastrecht_01_01"); //Probablemente eso sea mejor para ti.
	Info_ClearChoices	(DIA_Raoul_TROLL);
};

func void DIA_Raoul_TROLL_rechnung_ich ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_ich_15_00"); //Ya he matado a un troll negro.
	B_Raoul_Blame ();
};
func void DIA_Raoul_TROLL_rechnung_noProb ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLL_rechnung_noProb_15_00"); //¿Un troll negro? No hay problema.
	B_Raoul_Blame ();
};
	
///////////////////////////////////////////////////////////////////////
//	Info TrophyFur
///////////////////////////////////////////////////////////////////////

instance DIA_Raoul_TrophyFur		(C_INFO)
{
	npc		 = 	Sld_822_Raoul;
	nr		 = 	3;
	condition	 = 	DIA_Raoul_TrophyFur_Condition;
	information	 = 	DIA_Raoul_TrophyFur_Info;
	permanent	 = 	TRUE;

	description	 = 	"Primero dime cómo despegar la piel del troll.";
};

func int DIA_Raoul_TrophyFur_Condition ()
{
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)		
	&& (MIS_Raoul_KillTrollBlack == LOG_RUNNING)
		{
				return TRUE;
		};
};

func void DIA_Raoul_TrophyFur_Info ()
{
	AI_Output			(other, self, "DIA_Raoul_TrophyFur_15_00"); //Primero dime cómo despellejar al troll.

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
	{
		AI_Output			(self, other, "DIA_Raoul_TrophyFur_01_01"); //Entonces abre las orejas. Este truco es gratis.
		AI_Output			(self, other, "DIA_Raoul_TrophyFur_01_02"); //Agarras a la bestia y le haces un corte en cada pierna.
		AI_Output			(self, other, "DIA_Raoul_TrophyFur_01_03"); //Luego, tiras de la piel de la cosa por encima de sus orejas. ¿Es difícil o qué?
	};	
};

///////////////////////////////////////////////////////////////////////
//	Info TrollFell
///////////////////////////////////////////////////////////////////////

instance DIA_Raoul_TROLLFELL		(C_INFO)
{
	npc		 = 	Sld_822_Raoul;
	nr		 = 	3;
	condition	 = 	DIA_Raoul_TROLLFELL_Condition;
	information	 = 	DIA_Raoul_TROLLFELL_Info;

	description	 = 	"Tengo la piel de un troll negro.";
};

func int DIA_Raoul_TROLLFELL_Condition ()
{
	if (Npc_HasItems (other,ItAt_TrollBlackFur))
	&& (Npc_KnowsInfo(other, DIA_Raoul_TROLL))
		{
				return TRUE;
		};
};

func void DIA_Raoul_TROLLFELL_Info ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLLFELL_15_00"); //Tengo la piel de un troll negro.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_01_01"); //Imposible. Enséñamela.
	B_GiveInvItems 		(other, self, ItAt_TrollBlackFur,1);
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_01_02"); //Increíble. ¿Qué quieres a cambio?
	AI_Output			(other, self, "DIA_Raoul_TROLLFELL_15_03"); //Dame lo que tengas.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_01_04"); //De acuerdo. Te daré 500 monedas de oro y tres pociones de curación fuertes de propina, ¿qué te parece?
	
	Info_ClearChoices	(DIA_Raoul_TROLLFELL);
	Info_AddChoice	(DIA_Raoul_TROLLFELL, "No es suficiente.", DIA_Raoul_TROLLFELL_nein );
	Info_AddChoice	(DIA_Raoul_TROLLFELL, "Hecho.", DIA_Raoul_TROLLFELL_ja );

	MIS_Raoul_KillTrollBlack = LOG_SUCCESS;
	B_GivePlayerXP (XP_Raoul_KillTrollBlack);
};

func void DIA_Raoul_TROLLFELL_ja ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLLFELL_ja_15_00"); //Vendida.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_ja_01_01"); //Ha sido un placer.
	CreateInvItems (self, ItPo_Health_03, 3);									
	B_GiveInvItems (self, other, ItPo_Health_03, 3);					
	CreateInvItems (self, ItMi_Gold, 500);									
	B_GiveInvItems (self, other, ItMi_Gold, 500);					
	Info_ClearChoices	(DIA_Raoul_TROLLFELL);

};

func void DIA_Raoul_TROLLFELL_nein ()
{
	AI_Output			(other, self, "DIA_Raoul_TROLLFELL_nein_15_00"); //No es suficiente.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_nein_01_01"); //Tú mismo. Me quedaré con la piel, de todas formas.
	AI_Output			(self, other, "DIA_Raoul_TROLLFELL_nein_01_02"); //No voy a permitir que se me escape esta oportunidad.
	MIS_Raoul_DoesntPayTrollFur = LOG_RUNNING;
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info FellZurueck
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_FELLZURUECK		(C_INFO)
{
	npc		 = 	Sld_822_Raoul;
	nr		 = 	3;
	condition	 = 	DIA_Raoul_FELLZURUECK_Condition;
	information	 = 	DIA_Raoul_FELLZURUECK_Info;
	permanent	 = 	TRUE;

	description	 = 	"Devuélveme mi piel de troll.";
};

func int DIA_Raoul_FELLZURUECK_Condition ()
{
	if (MIS_Raoul_DoesntPayTrollFur == LOG_RUNNING)
	&& (Npc_HasItems (self,ItAt_TrollBlackFur))
		{
				return TRUE;
		};
};

func void DIA_Raoul_FELLZURUECK_Info ()
{
	AI_Output			(other, self, "DIA_Raoul_FELLZURUECK_15_00"); //Devuélveme mi piel de troll.
	AI_Output			(self, other, "DIA_Raoul_FELLZURUECK_01_01"); //No.
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info GotTrollFurBack
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_GotTrollFurBack		(C_INFO)
{
	npc		 = 	Sld_822_Raoul;
	nr		 = 	3;
	condition	 = 	DIA_Raoul_GotTrollFurBack_Condition;
	information	 = 	DIA_Raoul_GotTrollFurBack_Info;

	description	 = 	"No vuelvas a intentar desplumarme, ¿entendido?";
};

func int DIA_Raoul_GotTrollFurBack_Condition ()
{
	if (MIS_Raoul_DoesntPayTrollFur == LOG_RUNNING)
	&& (Npc_HasItems (self,ItAt_TrollBlackFur) == FALSE)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
				return TRUE;
		};
};

func void DIA_Raoul_GotTrollFurBack_Info ()
{
	AI_Output			(other, self, "DIA_Raoul_GotTrollFurBack_15_00"); //No vuelvas a intentar desplumarme, ¿entendido?
	AI_Output			(self, other, "DIA_Raoul_GotTrollFurBack_01_01"); //Muy bien. Ya sabes cómo funcionan las cosas por aquí, ¿no? Así que cálmate.
	MIS_Raoul_DoesntPayTrollFur = LOG_SUCCESS;
	AI_StopProcessInfos (self);
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

INSTANCE DIA_Raoul_KAP3_EXIT(C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 999;
	condition	= DIA_Raoul_KAP3_EXIT_Condition;
	information	= DIA_Raoul_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Raoul_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Raoul_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Raoul_KAP4_EXIT(C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 999;
	condition	= DIA_Raoul_KAP4_EXIT_Condition;
	information	= DIA_Raoul_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Raoul_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Raoul_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
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

INSTANCE DIA_Raoul_KAP5_EXIT(C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 999;
	condition	= DIA_Raoul_KAP5_EXIT_Condition;
	information	= DIA_Raoul_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Raoul_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Raoul_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Ship
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_Ship		(C_INFO)
{
	npc		 = 	Sld_822_Raoul;
	nr		 = 	2;
	condition	 = 	DIA_Raoul_Ship_Condition;
	information	 = 	DIA_Raoul_Ship_Info;

	description	 = 	"¿Te gustaría realizar un crucero por el océano, que te sacara de aquí?";
};

func int DIA_Raoul_Ship_Condition ()
{
	if (Kapitel >= 5)	
	&& (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_Ship_Info ()
{
	AI_Output			(other, self, "DIA_Raoul_Ship_15_00"); //¿Te apetece un crucero por el océano para salir de aquí?
	AI_Output			(self, other, "DIA_Raoul_Ship_01_01"); //¿Qué planeas? ¿Vas a capturar el barco de los paladines? (se ríe).
	AI_Output			(other, self, "DIA_Raoul_Ship_15_02"); //¿Y qué si lo hago?
	AI_Output			(self, other, "DIA_Raoul_Ship_01_03"); //(Con seriedad) Estás completamente loco. No, gracias. No es para mí.
	AI_Output			(self, other, "DIA_Raoul_Ship_01_04"); //No veo ninguna razón para abandonar Khorinis. Ganarme la vida aquí o en el continente es lo mismo para mí.
	AI_Output			(self, other, "DIA_Raoul_Ship_01_05"); //Búscate a otro.

	if ((Npc_IsDead(Torlof))== FALSE)
	{
		AI_Output			(self, other, "DIA_Raoul_Ship_01_06"); //Pregunta a Torlof. Solía salir al mar, que yo sepa.
	};
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


INSTANCE DIA_Raoul_KAP6_EXIT(C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 999;
	condition	= DIA_Raoul_KAP6_EXIT_Condition;
	information	= DIA_Raoul_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Raoul_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Raoul_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Raoul_PICKPOCKET (C_INFO)
{
	npc			= Sld_822_Raoul;
	nr			= 900;
	condition	= DIA_Raoul_PICKPOCKET_Condition;
	information	= DIA_Raoul_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Raoul_PICKPOCKET_Condition()
{
	C_Beklauen (45, 85);
};
 
FUNC VOID DIA_Raoul_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Raoul_PICKPOCKET);
	Info_AddChoice		(DIA_Raoul_PICKPOCKET, DIALOG_BACK 		,DIA_Raoul_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Raoul_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Raoul_PICKPOCKET_DoIt);
};

func void DIA_Raoul_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Raoul_PICKPOCKET);
};
	
func void DIA_Raoul_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Raoul_PICKPOCKET);
};


































	
	
	
	


























