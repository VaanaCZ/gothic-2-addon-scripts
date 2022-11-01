// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Thorben_EXIT(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 999;
	condition	= DIA_Thorben_EXIT_Condition;
	information	= DIA_Thorben_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Thorben_EXIT_Condition()
{
		return TRUE;
};
FUNC VOID DIA_Thorben_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Thorben_PICKPOCKET (C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 900;
	condition	= DIA_Thorben_PICKPOCKET_Condition;
	information	= DIA_Thorben_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Thorben_PICKPOCKET_Condition()
{
	C_Beklauen (30, 28);
};
 
FUNC VOID DIA_Thorben_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Thorben_PICKPOCKET);
	Info_AddChoice		(DIA_Thorben_PICKPOCKET, DIALOG_BACK 		,DIA_Thorben_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Thorben_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Thorben_PICKPOCKET_DoIt);
};

func void DIA_Thorben_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Thorben_PICKPOCKET);
};
	
func void DIA_Thorben_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Thorben_PICKPOCKET);
};

// ************************************************************
// 		NEWS - Gritta ist tot Thorben ist angepisst
// ************************************************************
INSTANCE DIA_Thorben_angepisst(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 1;
	condition	= DIA_Thorben_angepisst_Condition;
	information	= DIA_Thorben_angepisst_Info;
	permanent	= TRUE;
	important   = TRUE; 
};                       
FUNC INT DIA_Thorben_angepisst_Condition()
{	
	if (Npc_IsDead (Gritta))
	&& (Npc_IsInState (self, ZS_Talk))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_angepisst_Info()
{	
	AI_Output (self, other,"DIA_Thorben_angepisst_06_00"); //Has asesinado a mi Gritta. Nunca te lo perdonaré. ¡Fuera de mi vista, asesino!
	AI_StopProcessInfos (self);
};

// ************************************************************
// 		Hallo
// ************************************************************
INSTANCE DIA_Thorben_Hallo(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Hallo_Condition;
	information	= DIA_Thorben_Hallo_Info;
	permanent	= FALSE;
	important   = TRUE;
};                       
FUNC INT DIA_Thorben_Hallo_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Hallo_Info()
{	
	AI_Output (self, other,"DIA_Thorben_Hallo_06_00"); //¡Ah! Una cara nueva. Tú no eres de Khorinis, ¿verdad?
	AI_Output (self, other,"DIA_Thorben_Hallo_06_01"); //No es una buena época para viajar. Hay bandidos por todas partes, no hay trabajo y ahora los granjeros también se han sublevado.
	AI_Output (self, other,"DIA_Thorben_Hallo_06_02"); //¿Qué vientos te han traído por aquí?
};

// ************************************************************
// 		Suche Arbeit			//E1
// ************************************************************
INSTANCE DIA_Thorben_Arbeit(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Arbeit_Condition;
	information	= DIA_Thorben_Arbeit_Info;
	permanent	= FALSE;
	description = "Busco trabajo.";
};                       
FUNC INT DIA_Thorben_Arbeit_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Thorben_Arbeit_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_00"); //Busco trabajo.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_01"); //¿Sabes algo sobre carpintería?
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_02"); //Lo único que sé hacer con madera es fuego.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_03"); //¿Y sobre cerraduras?
	AI_Output (other, self,"DIA_Thorben_Arbeit_15_04"); //Bueeeenoo...
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_05"); //Lo siento pero no me vales si no sabes nada de mi oficio.
	AI_Output (self, other,"DIA_Thorben_Arbeit_06_06"); //Y yo no tengo dinero para pagar a un aprendiz.
	
	Log_CreateTopic (TOPIC_Lehrling,LOG_MISSION); 
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (TOPIC_Lehrling, "Thorben no me aceptará como su aprendiz.");
};

// ************************************************************
// 		Bei anderem Meister		(MIS Blessings)	//E2
// ************************************************************
INSTANCE DIA_Thorben_OtherMasters(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_OtherMasters_Condition;
	information	= DIA_Thorben_OtherMasters_Info;
	permanent	= FALSE;
	description = "¿Y si quiero ser aprendiz de uno de los otros maestros de aquí?";
};                       
FUNC INT DIA_Thorben_OtherMasters_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_OtherMasters_Info()
{	
	AI_Output (other, self,"DIA_Thorben_OtherMasters_15_00"); //¿Y si quiero ser aprendiz de uno de los otros maestros de aquí?
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_01"); //De acuerdo, te daré mi aprobación.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_02"); //Pero será mejor que primero obtengas la bendición de los dioses.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_06_03"); //Así que, ¿eres un hombre de fe?
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL)
	{
		Info_AddChoice (DIA_Thorben_OtherMasters, "Bueno, si te refieres a eso, rezo mis oraciones regularmente...", DIA_Thorben_OtherMasters_Naja);
	};
	Info_AddChoice (DIA_Thorben_OtherMasters, "Sí. Un sirviente de lo más humilde, maestro Thorben.", DIA_Thorben_OtherMasters_Devoutly);
};

func void B_Thorben_GetBlessings()
{
	AI_Output (self, other,"B_Thorben_GetBlessings_06_00"); //Pues habla con Vatras, el sacerdote de Adanos, y haz que te dé su bendición.
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL)
	{
		AI_Output (self, other,"B_Thorben_GetBlessings_06_01"); //Él te dirá dónde puedes encontrar a un sacerdote de Innos. También deberías obtener su bendición.
	};
	AI_Output (self, other,"B_Thorben_GetBlessings_06_02"); //Cuando tengas la bendición de los dioses, votaré a tu favor.
	
	MIS_Thorben_GetBlessings = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_Thorben,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Thorben,LOG_RUNNING);
	B_LogEntry (TOPIC_Thorben,"Thorben me dará su consentimiento, si un sacerdote de Adanos y otro de Innos me bendicen.");
};

func void DIA_Thorben_OtherMasters_Devoutly()
{
	AI_Output (other, self,"DIA_Thorben_OtherMasters_Devoutly_15_00"); //Sí. Un sirviente de lo más humilde, maestro Thorben.
	B_Thorben_GetBlessings();
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
};

func void DIA_Thorben_OtherMasters_Naja()
{
	AI_Output (other, self,"DIA_Thorben_OtherMasters_Naja_15_00"); //Bueno, si te refieres a eso, rezo mis oraciones regularmente...
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_01"); //¡Ya veo!
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_02"); //Un hombre que no ejerce su oficio con la bendición de los dioses nunca recibirá mi aprobación.
	AI_Output (self, other,"DIA_Thorben_OtherMasters_Naja_06_03"); //Pide perdón a los dioses por tus transgresiones.
	B_Thorben_GetBlessings();
	
	Info_ClearChoices (DIA_Thorben_OtherMasters);
};

// ************************************************************
// 		ZUSTIMMUNG		//E3  (PERM)
// ************************************************************
INSTANCE DIA_Thorben_ZUSTIMMUNG(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 1;
	condition	= DIA_Thorben_ZUSTIMMUNG_Condition;
	information	= DIA_Thorben_ZUSTIMMUNG_Info;
	permanent	= TRUE;
	description = "¿Qué hay de tu aprobación, maestro?";
};                       
FUNC INT DIA_Thorben_ZUSTIMMUNG_Condition()
{	
	if (Player_IsApprentice == APP_NONE)
	&& (MIS_Thorben_GetBlessings == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_ZUSTIMMUNG_Info()
{	
	AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_00"); //¿Qué hay de tu aprobación, maestro?
	AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_01"); //¿Te ha dado Vatras su bendición?
	
	if (Vatras_Segen == TRUE)
	{
		AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_02"); //Sí.
		AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_03"); //¿Y también recibiste la bendición de un sacerdote de Innos?
		
		if (Daron_Segen == TRUE)
		|| (Isgaroth_Segen == TRUE)
		|| (other.guild == GIL_KDF)
		{
			AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_04"); //Sí.
			AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_05"); //Pues entonces también recibirás mi bendición. No importa el camino que elijas seguir, ¡enorgullécete de hacer un buen trabajo, hijo mío!
			
			MIS_Thorben_GetBlessings = LOG_SUCCESS;
			B_GivePlayerXP (XP_Zustimmung);
			
			Log_CreateTopic (TOPIC_Lehrling,LOG_MISSION);
			Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
			B_LogEntry (TOPIC_Lehrling,"Thorben me dará su consentimiento si quiero trabajar como aprendiz.");
		}
		else
		{
			AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_06"); //No, todavía no...
			AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_07"); //Ya conoces mis condiciones. Solo deberías dedicarte a tu oficio con la bendición de los dioses.
		};
	}
	else
	{
		AI_Output (other, self,"DIA_Thorben_ZUSTIMMUNG_15_08"); //Aún no...
		AI_Output (self, other,"DIA_Thorben_ZUSTIMMUNG_06_09"); //Pues entonces no sé por qué me estás preguntando otra vez. Ya sabes mis condiciones.
	};
};

// ************************************************************
// 		Was weißt du über Schlösser?		//E2
// ************************************************************
INSTANCE DIA_Thorben_Locksmith(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Locksmith_Condition;
	information	= DIA_Thorben_Locksmith_Info;
	permanent	= FALSE;
	description = "¿Así que sabes mucho sobre cerraduras?";
};                       
FUNC INT DIA_Thorben_Locksmith_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Locksmith_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Locksmith_15_00"); //¿Así que sabes mucho sobre cerraduras?
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_01"); //¿De qué sirve un buen cofre sin una buena cerradura?
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_02"); //Hago mis propias cerraduras. De esa forma, al menos puedo estar seguro de no haber hecho mis cofres tan resistentes para nada.
	AI_Output (self, other,"DIA_Thorben_Locksmith_06_03"); //Una cerradura mal hecha es fácil de abrir. Y hay montones de ladrones rondando por Khorinis. ¡Sobre todo últimamente!
};

// ************************************************************
// 		Schuldenbuch
// ************************************************************
INSTANCE DIA_Thorben_Schuldenbuch(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Schuldenbuch_Condition;
	information	= DIA_Thorben_Schuldenbuch_Info;
	permanent	= FALSE;
	description = "Tengo el libro de cuentas de Lehmar justo aquí...";
};                       
FUNC INT DIA_Thorben_Schuldenbuch_Condition()
{	
	if (Npc_HasItems (other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Schuldenbuch_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_00"); //Tengo el libro de cuentas de Lehmar justo aquí...
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_01"); //(Suspicaz) ¿De dónde has sacado eso?
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_02"); //Eso no debería importarte tanto como el hecho de que tu nombre esté en él.
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_03"); //¡Dámelo!
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (other, self,"DIA_Thorben_Schuldenbuch_15_04"); //¿Y tú qué me darías a mí?
	AI_Output (self, other,"DIA_Thorben_Schuldenbuch_06_05"); //No tengo dinero que gastar y no puedo darte más que mi más sentida gratitud.
	B_GivePlayerXP (XP_Schuldenbuch);
};

// ************************************************************
// 		Kann ich Schlösser knacken lernen		//E3
// ************************************************************
INSTANCE DIA_Thorben_PleaseTeach(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_PleaseTeach_Condition;
	information	= DIA_Thorben_PleaseTeach_Info;
	permanent	= TRUE;
	description = "¿Puedes enseñarme a abrir cerraduras?";
};                       
FUNC INT DIA_Thorben_PleaseTeach_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Locksmith))
	&& (Thorben_TeachPlayer == FALSE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_PleaseTeach_Info()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_15_00"); //¿Puedes enseñarme a abrir cerraduras?
		
	if (Npc_HasItems (self, ItWr_Schuldenbuch) > 0)
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_01"); //Si no fuera por ti, estaría pagando a Lehmar durante el resto de mi vida.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_02"); //Te enseñaré lo que quieres saber.
		Thorben_TeachPlayer = TRUE;
	}
	else if (Thorben_GotGold == TRUE) //100 Gold bekommen
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_03"); //Me has traído las 100 monedas de oro. Eso ha sido muy honrado por tu parte.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_04"); //Casi me avergüenza, pero debo pedirte algo más.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_05"); //Si no puedo saldar pronto mi deuda con Lehmar, enviará a sus secuaces a por mí.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_06"); //Dame otras 100 monedas de oro y te instruiré.

		Info_ClearChoices (DIA_Thorben_PleaseTeach);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "¿Cuánto cobras?", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Bien. Aquí tienes 100 monedas de oro.", DIA_Thorben_PleaseTeach_Pay100);
	}
	else if (MIS_Matteo_Gold == LOG_SUCCESS) //Grittas Schulden bezahlt
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_07"); //Has pagado la deuda de Gritta con Matteo. Pareces un tipo decente. Te enseñaré lo que quieres saber.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_08"); //Sin embargo, no puedo hacerlo gratis. Aún tengo una montaña de deudas y necesito el dinero.
		AI_Output (other, self,"DIA_Thorben_PleaseTeach_15_09"); //¿Cuánto cobras?
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_10"); //200 monedas de oro.
		
		Info_ClearChoices (DIA_Thorben_PleaseTeach);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "¿Cuánto cobras?", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice (DIA_Thorben_PleaseTeach, "Bien. Aquí tienes 200 monedas de oro.", DIA_Thorben_PleaseTeach_Pay200);
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_11"); //Mmm... No sé si eres de confianza o no.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_12"); //Por lo que sé, podrías ser uno de esos holgazanes que solo vienen a la ciudad a vaciar los cofres de las personas honestas.
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_06_13"); //No voy a enseñarte nada hasta que esté convencido de que eres un tipo honesto.
	};
};

func void DIA_Thorben_PleaseTeach_Pay200()
{
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Pay200_15_00"); //Bien. Aquí tienes 200 monedas de oro.
	
	if (B_GiveInvItems (other, self, ItMi_Gold, 200))
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay200_06_01"); //Este dinero me va a venir muy bien. Podemos empezar tan pronto como estés preparado.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay200_06_02"); //Aún te faltan unas monedas para 200. Necesito ese dinero.
	};
	
	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};

func void DIA_Thorben_PleaseTeach_Pay100()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Pay100_15_00"); //Bien. Aquí tienes 100 monedas de oro.
		
	if (B_GiveInvItems (other, self, ItMi_Gold, 100))
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay100_06_01"); //En ese caso, podemos empezar cuando estés listo.
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_PleaseTeach_Pay100_06_02"); //Oye, aún te faltan unas monedas para llegar a 100.
	};
	
	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};
	
func void DIA_Thorben_PleaseTeach_Later()
{	
	AI_Output (other, self,"DIA_Thorben_PleaseTeach_Later_15_00"); //A lo mejor más tarde...

	Info_ClearChoices (DIA_Thorben_PleaseTeach);
};

// ************************************************************
// 		Schlösser knacken lernen		//E4
// ************************************************************
INSTANCE DIA_Thorben_Teach(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 2;
	condition	= DIA_Thorben_Teach_Condition;
	information	= DIA_Thorben_Teach_Info;
	permanent	= TRUE;
	description = B_BuildLearnString("¡Enséñame a abrir una cerradura!", B_GetLearnCostTalent(other, NPC_TALENT_PICKLOCK, 1));
};                       
FUNC INT DIA_Thorben_Teach_Condition()
{	
	if (Thorben_TeachPlayer == TRUE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) == 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Teach_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Teach_15_00"); //¡Enséñame a abrir una cerradura!
	
	if B_TeachThiefTalent (self, other, NPC_TALENT_PICKLOCK)
	{
		AI_Output (self, other,"DIA_Thorben_Teach_06_01"); //Lo único que necesitas es una ganzúa. Si la mueves con cuidado a la izquierda y a la derecha en la cerradura, puedes abrir el mecanismo.
		AI_Output (self, other,"DIA_Thorben_Teach_06_02"); //Pero si lo mueves mucho o demasiado rápido en la dirección equivocada, se partirá al momento.
		AI_Output (self, other,"DIA_Thorben_Teach_06_03"); //Cuanta más práctica tengas, menos ganzúas necesitarás. Eso es todo. En serio.
	};
};

// ************************************************************
// 		TRADE (PERM)
// ************************************************************
INSTANCE DIA_Thorben_TRADE(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 3;
	condition	= DIA_Thorben_TRADE_Condition;
	information	= DIA_Thorben_TRADE_Info;
	permanent	= TRUE;
	description = "¿Puedes venderme unas ganzúas?";
	trade		= TRUE;
};                       
FUNC INT DIA_Thorben_TRADE_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Locksmith))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_TRADE_Info()
{	
	AI_Output (other, self,"DIA_Thorben_TRADE_15_00"); //¿Puedes venderme algunas ganzúas?
	
	if (Npc_GetTalentSkill (other, NPC_TALENT_PICKLOCK) > 0)
	{
		AI_Output (self, other,"DIA_Thorben_TRADE_06_01"); //Si me queda alguna...
	}
	else
	{
		AI_Output (self, other,"DIA_Thorben_TRADE_06_02"); //Bueno, de acuerdo. Pero no te van a servir de nada mientras no sepas cómo funcionan.
	};
	
	if (Npc_HasItems (self, ITke_Lockpick) == 0) 
	&& (Kapitel > Dietrichgeben) 
	{
		CreateInvItems (self, ITKE_LOCKPICK,5);
		Dietrichgeben = Dietrichgeben +1;
	};
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"El carpintero Throben vende ganzúas."); 
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Thorben_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_462_Thorben;
	nr		 = 	4;
	condition	 = 	DIA_Addon_Thorben_MissingPeople_Condition;
	information	 = 	DIA_Addon_Thorben_MissingPeople_Info;

	description	 = 	"¿Has tenido algún aprendiz?";
};

func int DIA_Addon_Thorben_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Thorben_Arbeit))
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (Elvrich_GoesBack2Thorben == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Thorben_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Thorben_MissingPeople_15_00"); //¿Has tenido algún aprendiz?
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_01"); //Sí, no hace mucho.
	AI_Output	(other, self, "DIA_Addon_Thorben_MissingPeople_15_02"); //¿Y? ¿Qué ocurrió?
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_03"); //Se llama Elvrich. Es mi sobrino.
	AI_Output	(self, other, "DIA_Addon_Thorben_MissingPeople_06_04"); //Estaba encantado con él, la verdad, pero un buen día no vino a trabajar.
	
	MIS_Thorben_BringElvrichBack = LOG_RUNNING;

	Log_CreateTopic (TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_MissingPeople,"Elvrich, aprendiz del carpintero Thorben, ha desaparecido."); 
	
	Info_ClearChoices	(DIA_Addon_Thorben_MissingPeople);
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, DIALOG_BACK, DIA_Addon_Thorben_MissingPeople_Back );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "¿Has informado a la milicia?", DIA_Addon_Thorben_MissingPeople_Mil );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "¿Cuánto hace que no lo ves?", DIA_Addon_Thorben_MissingPeople_wann );
	Info_AddChoice	(DIA_Addon_Thorben_MissingPeople, "¿Dónde está ahora Elvrich?", DIA_Addon_Thorben_MissingPeople_where );
};

func void DIA_Addon_Thorben_MissingPeople_Back ()
{
	Info_ClearChoices	(DIA_Addon_Thorben_MissingPeople);
};

func void DIA_Addon_Thorben_MissingPeople_wann ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_wann_15_00"); //¿Cuánto hace que no lo ves?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_wann_06_01"); //Debe de hacer unas 2 semanas.
};

func void DIA_Addon_Thorben_MissingPeople_where ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_where_15_00"); //¿Dónde está ahora Elvrich?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_01"); //¿Cómo quieres que lo sepa? Frecuentaba ese burdel apestoso junto al puerto.
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_02"); //No me sorprendería que andara calentando la cama de alguna de esas chicas.
};

func void DIA_Addon_Thorben_MissingPeople_Mil ()
{
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_Mil_15_00"); //¿Has informado a la milicia?
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_01"); //Claro que sí. Se suponía que tenían que cogerlo y ocuparse de que ese holgazán cumpliera con su trabajo. Pero ahora me arrepiento.
	AI_Output			(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_02"); //Que haga lo que quiera. Tarde o temprano se dará cuenta de que no llegará a nada en Khorinis sin un trabajo honrado.
	AI_Output			(other, self, "DIA_Addon_Thorben_MissingPeople_Mil_15_03"); //(cínicamente) Si tú lo dices
};

///////////////////////////////////////////////////////////////////////
//	Info ElvrichIsBack
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Thorben_ElvrichIsBack		(C_INFO)
{
	npc		 = 	VLK_462_Thorben;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Thorben_ElvrichIsBack_Condition;
	information	 = 	DIA_Addon_Thorben_ElvrichIsBack_Info;

	description	 = 	"Elvrich volverá a trabajar para ti a partir de hoy.";
};

func int DIA_Addon_Thorben_ElvrichIsBack_Condition ()
{
	if (Elvrich_GoesBack2Thorben == TRUE)
	&& ((Npc_IsDead(Elvrich)) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_ElvrichIsBack_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Thorben_ElvrichIsBack_15_00"); //Elvrich volverá a trabajar para ti a partir de hoy.
	AI_Output	(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_01"); //Espero que no vuelva a desaparecer en cuanto se le contonee la siguiente fresca.
	AI_Output	(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_02"); //Acepta este oro como recompensa por devolverme a mi aprendiz.
	CreateInvItems (self, ItMi_Gold, 200);									
	B_GiveInvItems (self, other, ItMi_Gold, 200);
	MIS_Thorben_BringElvrichBack = LOG_SUCCESS;
	VLK_4302_Addon_Elvrich.flags = 0;
};

// ************************************************************
// 		Paladine		//E1
// ************************************************************
INSTANCE DIA_Thorben_Paladine(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 4;
	condition	= DIA_Thorben_Paladine_Condition;
	information	= DIA_Thorben_Paladine_Info;
	permanent	= FALSE;
	description = "¿Qué sabes de los paladines?";
};                       
FUNC INT DIA_Thorben_Paladine_Condition()
{	
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Thorben_Paladine_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Paladine_15_00"); //¿Qué sabes de los paladines?
	AI_Output (self, other,"DIA_Thorben_Paladine_06_01"); //No mucho. Llegaron en barco desde el continente hace dos semanas.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_02"); //Desde entonces, se han recluido en la parte alta de la ciudad.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_03"); //Aquí nadie sabe exactamente por qué han venido.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_04"); //Muchos tienen miedo de un ataque de los orcos.
	AI_Output (self, other,"DIA_Thorben_Paladine_06_05"); //Sin embargo, supongo que están aquí para sofocar la rebelión de los granjeros.
};

// ************************************************************
// 		Bauernaufstand		//E2
// ************************************************************
INSTANCE DIA_Thorben_Bauernaufstand(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 4;
	condition	= DIA_Thorben_Bauernaufstand_Condition;
	information	= DIA_Thorben_Bauernaufstand_Info;
	permanent	= FALSE;
	description = "¿Sabes algo sobre la rebelión de los campesinos?";
};                       
FUNC INT DIA_Thorben_Bauernaufstand_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Thorben_Paladine))
	&& (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Bauernaufstand_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Bauernaufstand_15_00"); //¿Sabes algo sobre la rebelión de los campesinos?
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_01"); //Los rumores dicen que Onar, el terrateniente, ha contratado a mercenarios para mantener apartadas a las tropas del Rey.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_02"); //Probablemente se cansó de tener que desperdiciar su cosecha y su ganado entregándoselos a los paladines y a la milicia.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_03"); //Lo único que notamos en esta ciudad es que los precios de la comida siguen subiendo.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_04"); //La granja de Onar está lejos, al este de aquí. Si hubiera algún enfrentamiento allí, no nos enteraríamos.
	AI_Output (self, other,"DIA_Thorben_Bauernaufstand_06_05"); //Si quieres saber más, pregunta a los comerciantes del mercado. Se mueven por la isla más que yo.
};

// ************************************************************
// 		Gritta
// ************************************************************
INSTANCE DIA_Thorben_Gritta(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 5;
	condition	= DIA_Thorben_Gritta_Condition;
	information	= DIA_Thorben_Gritta_Info;
	permanent	= FALSE;
	description = "He venido por Gritta...";
};                       
FUNC INT DIA_Thorben_Gritta_Condition()
{	
	if (MIS_Matteo_Gold == LOG_RUNNING)
	&& (!Npc_IsDead (Gritta))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_Gritta_Info()
{	
	AI_Output (other, self,"DIA_Thorben_Gritta_15_00"); //He venido por Gritta...
	AI_Output (self, other,"DIA_Thorben_Gritta_06_01"); //¿Mi sobrina? ¿Y qué tienes que ver tú con ella? Esto no es por dinero, ¿no?
	AI_Output (other, self,"DIA_Thorben_Gritta_15_02"); //Debe 100 monedas de oro al comerciante Matteo.
	
	AI_Output (self, other,"DIA_Thorben_Gritta_06_03"); //Dime que no es verdad. Desde que esa buena pieza se vino a vivir conmigo, ¡no he tenido más que problemas!
	AI_Output (self, other,"DIA_Thorben_Gritta_06_04"); //Está en deuda con prácticamente todos y cada uno de los comerciantes de la ciudad.
	AI_Output (self, other,"DIA_Thorben_Gritta_06_05"); //¡Tuve que pedir prestadas 200 monedas de oro a Lehmar el prestamista para saldar sus deudas! ¡Y ahora esto!
	if (Npc_GetDistToWP(self, "NW_CITY_MERCHANT_SHOP01_FRONT_01") < 500)
	{
		AI_Output (self, other,"DIA_Thorben_Gritta_06_06"); //Gritta debería estar en casa.
	};
	AI_Output (self, other,"DIA_Thorben_Gritta_06_07"); //Adelante, pregúntale. Pero ya te aviso: no tiene NI UNA moneda de oro.
	if (Npc_HasItems(Gritta, itmi_gold) >= 100)
	{
		AI_Output (other, self,"DIA_Thorben_Gritta_15_08"); //Ya veremos...
	};
};

// ************************************************************
// 		Grittas Gold genommen
// ************************************************************
INSTANCE DIA_Thorben_GrittaHatteGold(C_INFO)
{
	npc			= VLK_462_Thorben;
	nr			= 5;
	condition	= DIA_Thorben_GrittaHatteGold_Condition;
	information	= DIA_Thorben_GrittaHatteGold_Info;
	permanent	= FALSE;
	description = "Tu sobrina tenía 100 monedas de oro.";
};                       
FUNC INT DIA_Thorben_GrittaHatteGold_Condition()
{	
	if (Npc_KnowsInfo(other, DIA_Thorben_Gritta))
	&& (Npc_HasItems(Gritta, itmi_gold) < 100)
	&& (!Npc_IsDead (Gritta))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Thorben_GrittaHatteGold_Info()
{	
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_15_00"); //Tu sobrina tenía 100 monedas de oro.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_06_01"); //¿QUÉ? Esa serpiente descarada... ¡ese oro era MÍO! Lo cogió de mi cofre.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_06_02"); //¡Devuélvemelo! Tengo que pagar primero a Lehmar. ¡Matteo recibirá su dinero después!

	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
	if (MIS_Matteo_Gold == LOG_SUCCESS)
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "¡Ya he dado a Matteo su oro!", DIA_Thorben_GrittaHatteGold_MatteoHatEs);
	}
	else
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "No. Yo le devolveré a Matteo su dinero.", DIA_Thorben_GrittaHatteGold_MatteoSollHaben);
	};

	if (Npc_HasItems(other, itmi_gold) >= 100)
	{
		Info_AddChoice (DIA_Thorben_GrittaHatteGold, "Aquí tienes tu oro.", DIA_Thorben_GrittaHatteGold_HereItIs);
	};
};

func void B_Thorben_DeletePetzCrimeGritta()
{
	if (Gritta_GoldGiven == FALSE)
	{
		AI_Output (self, other,"B_Thorben_DeletePetzCrimeGritta_06_00"); //Y por lo que conozco a esta viborilla, ¡seguro que irá directo a la guardia de la ciudad y te acusará también!
		AI_Output (self, other,"B_Thorben_DeletePetzCrimeGritta_06_01"); //Me encargaré de que el asunto se solucione.
		B_DeletePetzCrime (Gritta);
	};
};

func void DIA_Thorben_GrittaHatteGold_MatteoHatEs()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_15_00"); //¡Ya he dado a Matteo su oro!
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_06_01"); //¡Maldita sea! Bueno, en fin, una deuda es una deuda. Por lo menos no te quedaste con el dinero. Supongo que debería agradecértelo.
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_MatteoSollHaben()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_15_00"); //No. Yo le devolveré a Matteo su dinero.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_01"); //Así me estás metiendo en un buen lío. Lehmar no es muy generoso en lo que respecta a las deudas.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_02"); //Pero al menos planeas pagar las deudas de mi sobrina. Supongo que debería agradecértelo.
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_HereItIs()
{
	AI_Output (other, self,"DIA_Thorben_GrittaHatteGold_HereItIs_15_00"); //Aquí tienes tu oro.
	B_GiveInvItems(other, self, itmi_gold, 100);
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_01"); //¡Gracias! Ahora al menos tengo parte del dinero que debo a Lehmar.
	AI_Output (self, other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_02"); //¡No me puedo creer que tuviera la audacia de coger mi dinero!
	
	B_Thorben_DeletePetzCrimeGritta();
	
	Thorben_GotGold = TRUE;
	
	Info_ClearChoices (DIA_Thorben_GrittaHatteGold);
};



















