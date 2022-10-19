//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_EXIT   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 999;
	condition   = DIA_Addon_Snaf_EXIT_Condition;
	information = DIA_Addon_Snaf_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Snaf_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Snaf_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Snaf_PICKPOCKET (C_INFO)
{
	npc			= BDT_1098_Addon_Snaf;
	nr			= 900;
	condition	= DIA_Addon_Snaf_PICKPOCKET_Condition;
	information	= DIA_Addon_Snaf_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       
FUNC INT DIA_Addon_Snaf_PICKPOCKET_Condition()
{
	C_Beklauen (49, 56);
};
 
FUNC VOID DIA_Addon_Snaf_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Snaf_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Snaf_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Snaf_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Snaf_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Snaf_PICKPOCKET_DoIt);
};

func void DIA_Addon_Snaf_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Snaf_PICKPOCKET);
};
	
func void DIA_Addon_Snaf_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Snaf_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_Hi   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 1;
	condition   = DIA_Addon_Snaf_Hi_Condition;
	information = DIA_Addon_Snaf_Hi_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Snaf_Hi_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Snaf_Hi_01_00"); //¿Quieres comer o charlotear? ¿Qué va a ser?
};
//---------------------------------------------------------------------
//	Was gibt's denn leckeres?
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_Cook (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 2;
	condition   = DIA_Addon_Snaf_Cook_Condition;
	information = DIA_Addon_Snaf_Cook_Info;
	permanent   = FALSE;
	description = "¿Qué hay de menú?";
};
FUNC INT DIA_Addon_Snaf_Cook_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Snaf_Cook_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_15_00"); //¿Qué hay de menú?
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_01_01"); //Quiero probar un nuevo plato: 'Tiras de fuego con salsa martillo'.
	
	Info_ClearChoices (DIA_Addon_Snaf_Cook);
	Info_AddChoice 	  (DIA_Addon_Snaf_Cook,"¿Tiras de fuego?",DIA_Addon_Snaf_Cook_FEUER);	
	Info_AddChoice 	  (DIA_Addon_Snaf_Cook,"¿Salsa de martilo?",DIA_Addon_Snaf_Cook_HAMMER);
};
//---------------------------------------------------------------------
FUNC VOID DIA_Addon_Snaf_Cook_FEUER()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_FEUER_15_00");//¿Tiras de fuego?
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_FEUER_01_01");//Carne crujiente, ligeramente asada con hierba del fuego especiada.
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_FEUER_01_02");//Pero tranquilo, ya tengo todos los ingredientes.
};
FUNC VOID DIA_Addon_Snaf_Cook_HAMMER()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_HAMMER_15_00");//¿Salsa martillo?
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_HAMMER_01_01");//Una salsa de licor martillo potente. Tengo una fórmula de un tipo llamado Lou.
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_HAMMER_01_02");//Si consigues los ingredientes y destilas el licor en la mesa de alquimista, te prepararé una salsa. ¿Qué te parece?
	
	Info_AddChoice (DIA_Addon_Snaf_Cook,"No tengo tiempo para eso.",DIA_Addon_Snaf_Cook_NO);
	Info_AddChoice (DIA_Addon_Snaf_Cook,"Vale, lo haré.",DIA_Addon_Snaf_Cook_YES);
	
};
FUNC VOID DIA_Addon_Snaf_Cook_NO ()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_HAMMER_NO_15_00");//No tengo tiempo.
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_HAMMER_NO_01_01");//Olvídalo.
	
	MIS_SnafHammer = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Addon_Snaf_Cook);
};
FUNC VOID DIA_Addon_Snaf_Cook_YES()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_HAMMER_YES_15_00");//Muy bien, lo haré.
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_HAMMER_YES_01_01");//Perfecto. Esta es la receta.
	
	B_GiveInvItems (self, other,ItWr_Addon_Lou_Rezept,1);
	MIS_SnafHammer = LOG_RUNNING;
	Info_ClearChoices (DIA_Addon_Snaf_Cook);
	
	Log_CreateTopic (Topic_Addon_Hammer,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Hammer,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Hammer,"Snaf necesita bebida para su salsa. Me dio la fórmula del martillo, una bebida que puedo preparar en el laboratorio.");
};
//---------------------------------------------------------------------
//	Info Booze
//---------------------------------------------------------------------
var int Snaf_Tip_Kosten;
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_Booze   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 3;
	condition   = DIA_Addon_Snaf_Booze_Condition;
	information = DIA_Addon_Snaf_Booze_Info;
	permanent   = FALSE;
	description = "He destilado el licor.";
};
FUNC INT DIA_Addon_Snaf_Booze_Condition()
{	
	if (Npc_HasItems (other, ItFo_Addon_LousHammer) >= 1)
	&& (MIS_SnafHammer == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Booze_Info()
{
	B_GiveInvItems (other, self, ItFo_Addon_LousHammer, 1);
	
	AI_Output (other, self, "DIA_Addon_Snaf_Booze_15_00");//He destilado el licor.
	AI_Output (self, other, "DIA_Addon_Snaf_Booze_01_01");//Muy bien, yo lo terminaré.
	AI_Output (self, other, "DIA_Addon_Snaf_Booze_01_02");//Toma, puedes probar un poco ahora mismo. Esto fortalecerá tu brazo.
	AI_Output (self, other, "DIA_Addon_Snaf_Booze_01_03");//Oh, y si puedo volver a ayudarte… A partir de ahora, toda la información te saldrá gratis.
	Snaf_Tip_Kosten = 0;
	B_GiveInvItems (self, other, ItFo_Addon_FireStew,1);
	MIS_SnafHammer = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Loushammer);
};

//---------------------------------------------------------------------
//	ATTENTAT
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_Attentat   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 4;
	condition   = DIA_Addon_Snaf_Attentat_Condition;
	information = DIA_Addon_Snaf_Attentat_Info;
	permanent   = FALSE;
	description = "¿Qué sabes sobre el ataque?";
};
FUNC INT DIA_Addon_Snaf_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Attentat_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Attentat_15_00"); //¿Qué sabes sobre el ataque?
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_01_01"); //¿El asunto de Esteban?
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_01_02"); //Ya sabes cómo funciona esto. Un camarero escucha todo, pero nunca se moja.
	
	Info_ClearChoices (DIA_Addon_Snaf_Attentat);
	Info_AddChoice 	  (DIA_Addon_Snaf_Attentat,"Al menos dime a quién preguntar.",DIA_Addon_Snaf_Attentat_GoWhere);
	Info_AddChoice 	  (DIA_Addon_Snaf_Attentat,"Si estuvieras en mi lugar, ¿qué harías?",DIA_Addon_Snaf_Attentat_YouBeingMe);
	Info_AddChoice 	  (DIA_Addon_Snaf_Attentat,"¿Así que sabes algo?",DIA_Addon_Snaf_Attentat_Something);	
};
	
func void DIA_Addon_Snaf_Attentat_Something()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Attentat_Something_15_00"); //¿Así que sabes algo?
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_Something_01_01"); //No he dicho ESO.
};
func void DIA_Addon_Snaf_Attentat_GoWhere()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Attentat_GoWhere_15_00"); //Al menos dime a quién puedo recurrir.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_GoWhere_01_01"); //¡Amigo, cómo voy a decirte eso! ¡Ni lo sueñes!
};
func void DIA_Addon_Snaf_Attentat_YouBeingMe()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Attentat_YouBeingMe_15_00"); //Si estuvieras en mi lugar, ¿qué harías?
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_01"); //Meditaría acerca de lo que sé sobre quién anda detrás de todo.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_02"); //En primer lugar, probablemente fuera un bandido, así que está aquí, en el campamento.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_03"); //En segundo lugar, si está en el campamento, te tendrá vigilado.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_04"); //En tercer lugar, mientras crea que estás de parte de Esteban, no se te mostrará.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_05"); //Así la pregunta que interesa es: ¿qué posibilidades tienes de encontrar a tu hombre?

	Info_ClearChoices (DIA_Addon_Snaf_Attentat);
};

//---------------------------------------------------------------------
//	Info Abrechnung
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_Abrechnung   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 5;
	condition   = DIA_Addon_Snaf_Abrechnung_Condition;
	information = DIA_Addon_Snaf_Abrechnung_Info;
	permanent   = TRUE;
	description = "¿Qué posibilidades tengo de encontrar a mi hombre?";
};
FUNC INT DIA_Addon_Snaf_Abrechnung_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Snaf_Attentat)
	&& (MIS_JUDAS == LOG_RUNNING)
	&& (Huno_zuSnaf == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Abrechnung_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Abrechnung_15_00"); //¿Qué posibilidades tengo de encontrar a mi hombre?
	AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_01"); //Hmmm...
	
	if (Senyan_Erpressung == LOG_RUNNING) 
	&& (!Npc_IsDead (Senyan))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_02"); //Pues muy pocas. Hay gente que ha observado que te mezclas con Senyan.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_03"); //Tendrás que romper tu relación con él o nunca podrás encontrar al responsable del ataque.
		
		if (Snaf_Tip_Senyan == FALSE)
		{
			B_LogEntry (Topic_Addon_Senyan,"Debería dejar de ver a Senyan, aunque tampoco sería muy inteligente atacarle directamente. Hablaré con él antes.");
			Snaf_Tip_Senyan = TRUE;
		};
	}
	else if (Npc_IsDead(Senyan))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_04"); //Te has cargado a uno de los hombres de Esteban. El hombre que buscas creerá que estás de su lado.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_05"); //Aun así, no se te revelará. Tendrás que averiguar más.
	}
	else if (Finn_Petzt == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_06"); //Finn parece muy inquieto desde que hablaste con él.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_07"); //Y aquí todos piensan que tiene buena relación con Esteban.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_08"); //Eso significa que probablemente le dijeras algo que no quería oír.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_09"); //Eso agradará al hombre que andas buscando
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_10"); //Sin embargo, existe el peligro de que corra a contárselo a Esteban, (con ironía) pero eso ya lo sabes t
	}
	if (Finn_TellAll == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_11"); //Dicen que le contaste a Finn que trabajabas para Esteban.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_12"); //No sé lo que estás tramando, pero el hombre al que buscas tendrá más cuidado de ahora en adelante.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_13"); //Hasta ahora, todo sigue abierto.
	};
	
	//------------------- Abschied ----------------------------------
	if (Snaf_Rechnung == FALSE)
	{
		if (Snaf_Einmal == FALSE)
		{
			AI_Output (other, self, "DIA_Addon_Snaf_Abschied_15_14"); //Gracias.
			AI_Output (self, other, "DIA_Addon_Snaf_Abschied_01_15"); //(brusco) ¡Eh! No te he contado nada que no supieras, ¿¡entendido!?
			
			Snaf_Einmal = TRUE;
		}
		else
		{
			AI_Output (other, self, "DIA_Addon_Snaf_Abschied_15_16"); //Ya lo sabía
			AI_Output (self, other, "DIA_Addon_Snaf_Abschied_01_17"); //Exacto.
		};
	};
};

//---------------------------------------------------------------------
//	HOCH
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_HOCH (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 6;
	condition   = DIA_Addon_Snaf_HOCH_Condition;
	information = DIA_Addon_Snaf_HOCH_Info;
	permanent   = FALSE;
	description = "Huno dice que debería encontrarme aquí con alguien…";
};
FUNC INT DIA_Addon_Snaf_HOCH_Condition()
{	
	if (Huno_zuSnaf == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_HOCH_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_HOCH_15_00"); //Me envía Huno.
	AI_Output (self, other, "DIA_Addon_Snaf_HOCH_01_01"); //Parece que has encontrado a tu hombre.
	AI_Output (self, other, "DIA_Addon_Snaf_HOCH_01_02"); //Sube al siguiente piso, te están esperando.
		
	AI_StopProcessInfos (self);
	AI_Teleport (Fisk,"BL_INN_UP_06");
	B_StartotherRoutine (Fisk,"MEETING");

	B_GivePlayerXP (XP_Addon_Auftraggeber);
};

//---------------------------------------------------------------------
//	People
//---------------------------------------------------------------------
var int Kosten_Einmal;
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_People (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 6;
	condition   = DIA_Addon_Snaf_People_Condition;
	information = DIA_Addon_Snaf_People_Info;
	permanent   = TRUE;
	description = "¿Qué opina aquí la gente de Esteben?";
};
FUNC INT DIA_Addon_Snaf_People_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Snaf_Attentat))
	&& (!Npc_IsDead (Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_People_Info()
{
	
	AI_Output (other, self, "DIA_Addon_Snaf_People_15_00"); //¿Qué opina aquí la gente de Esteben?
	AI_Output (self, other, "DIA_Addon_Snaf_People_01_01"); //Tendrás que precisar un poco más
	if (Kosten_Einmal == FALSE)
	&& (MIS_SnafHammer != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_01_02"); //Cada dato te costar
		AI_Output (other, self, "DIA_Addon_Snaf_People_15_03"); //¿Cuánto?
		AI_Output (self, other, "DIA_Addon_Snaf_People_01_04"); //¡10 monedas de oro!
		
		Snaf_Tip_Kosten = 10;
		Kosten_Einmal = TRUE;
	};
	
	Info_ClearChoices (DIA_Addon_Snaf_People);
	Info_AddChoice (DIA_Addon_Snaf_People, DIALOG_BACK, DIA_Addon_Snaf_People_BACK);
	Info_AddChoice (DIA_Addon_Snaf_People, "Paul.", DIA_Addon_Snaf_People_Paul);
	Info_AddChoice (DIA_Addon_Snaf_People, "Huno.", DIA_Addon_Snaf_People_Huno);
	Info_AddChoice (DIA_Addon_Snaf_People, "Fisk.", DIA_Addon_Snaf_People_Fisk);
	Info_AddChoice (DIA_Addon_Snaf_People, "Emilio.", DIA_Addon_Snaf_People_Emilio);
	if (!Npc_IsDead (Senyan))
	{
		Info_AddChoice (DIA_Addon_Snaf_People, "Senyan.", DIA_Addon_Snaf_People_Senyan);
	};
	Info_AddChoice (DIA_Addon_Snaf_People, "Lennar.", DIA_Addon_Snaf_People_Lennar);
	Info_AddChoice (DIA_Addon_Snaf_People, "Finn.", DIA_Addon_Snaf_People_Finn);
};
// --------------------------------------------
	func void B_Addon_Snaf_NotEnough()
	{
		AI_Output (self, other, "DIA_Addon_Snaf_NotEnough_01_00"); //¡No tienes suficiente oro, amigo!
	};

FUNC VOID DIA_Addon_Snaf_People_BACK()
{
	Info_ClearChoices (DIA_Addon_Snaf_People);
};
FUNC VOID DIA_Addon_Snaf_People_Paul()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Paul_15_00"); //¿Y qué pasa con Paul?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Paul_01_01"); //Creo que Esteban no es santo de su devoción. Como ha trabajado para Huno, nunca entrará en la mina.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};
FUNC VOID DIA_Addon_Snaf_People_Huno()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Huno_15_00"); //¿Qué opina Huno de Esteban?
	AI_Output (self, other, "DIA_Addon_Snaf_People_Huno_01_01"); //¡Ah! Huno. No sé casi nada sobre él.
	AI_Output (self, other, "DIA_Addon_Snaf_People_Huno_01_02"); //(sonríe) Esa información no te la cobro, por supuesto.
};
FUNC VOID DIA_Addon_Snaf_People_Fisk()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Fisk_15_00"); //¿Y qué me dices de Fisk?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Fisk_01_01"); //Fisk es Fisk. Paga su cuota a Esteban y distribuye la mercancía que consigue principalmente de los piratas.
		AI_Output (self, other, "DIA_Addon_Snaf_People_Fisk_01_02"); //No creo que le preocupe mucho Esteban.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};
FUNC VOID DIA_Addon_Snaf_People_Emilio()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Emilio_15_00"); //Emilio. ¿Qué opina sobre Esteban?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Emilio_01_01"); //No creo que llevara flores a la tumba de Esteban, ya sabes.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};
FUNC VOID DIA_Addon_Snaf_People_Senyan()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Senyan_15_00"); //¿Y Senyan?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Senyan_01_01"); //Senyan es uno de los hombres de Esteben. Lleva un tiempo trabajando para él.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};
FUNC VOID DIA_Addon_Snaf_People_Lennar()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Lennar_15_00"); //¿Qué opina Lennar sobre Esteban?
	AI_Output (self, other, "DIA_Addon_Snaf_People_Lennar_01_01"); //Por lo que yo sé, Lennar no piensa NADA de NADA.
};

func VOID DIA_Addon_Snaf_People_Finn()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Finn_15_00"); //¿Y Finn?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Finn_01_01"); //Un buen cavador. Tiene olfato para el oro.
		AI_Output (self, other, "DIA_Addon_Snaf_People_Finn_01_02"); //Esteban le favorece por ese motivo. Creo que mantienen una relación bastante buena.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

//---------------------------------------------------------------------
//	Und du?
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_Himself (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 7;
	condition   = DIA_Addon_Snaf_Himself_Condition;
	information = DIA_Addon_Snaf_Himself_Info;
	permanent   = FALSE;
	description = "¿Qué opinas TÚ de Esteban?";
};
FUNC INT DIA_Addon_Snaf_Himself_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Snaf_Attentat))
	&& (!Npc_IsDead (Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Himself_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Himself_15_00"); //¿Qué opinas TÚ de Esteban?
	AI_Output (self, other, "DIA_Addon_Snaf_Himself_01_01"); //Quien hable de él, es hombre muerto.
	//AI_Output (other, self, "DIA_Addon_Snaf_Himself_15_02"); //Und?
	//AI_Output (self, other, "DIA_Addon_Snaf_Himself_01_03"); //Ende der Geschichte. //wav fehlt
};

//---------------------------------------------------------------------
//	PERM
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_PERM (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 8;
	condition   = DIA_Addon_Snaf_PERM_Condition;
	information = DIA_Addon_Snaf_PERM_Info;
	permanent   = TRUE;
	description = "¿Qué tal va el negocio?";
};
FUNC INT DIA_Addon_Snaf_PERM_Condition()
{	
	if (Npc_IsDead (Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_PERM_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_PERM_15_00"); //¿Cómo van los negocios?
	AI_Output (self, other, "DIA_Addon_Snaf_PERM_01_01"); //¡Bien! La muerte de Esteban es algo que celebrar para muchos
};


