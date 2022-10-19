// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Lee_EXIT   (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 999;
	condition   = DIA_Lee_EXIT_Condition;
	information = DIA_Lee_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Lee_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


// **************
// B_Lee_Teleport
// **************

var int Lee_Teleport; //damit es nur EINMAL kommt
// ------------------

func void B_Lee_Teleport()
{
	AI_Output (self ,other, "DIA_Lee_Add_04_05"); //Ah. Me alegro de que hayas venido.
	AI_Output (other, self, "DIA_Lee_Add_15_06"); //¿Qué pasa?
	AI_Output (self ,other, "DIA_Lee_Add_04_07"); //Encontré esto en la vieja capilla.
	B_GiveInvItems (self, other, ItRu_TeleportFarm, 1);
	AI_Output (self ,other, "DIA_Lee_Add_04_08"); //Es una runa mágica. Creo que te teletransportará de vuelta aquí, a la granja.
	AI_Output (self ,other, "DIA_Lee_Add_04_09"); //He pensado que podría resultarte útil.
	
	Lee_Teleport = TRUE;
};


// ************************************************************
// 					Petzmaster: Schulden offen 
// ************************************************************

// ---------------------------
var int Lee_LastPetzCounter;
var int Lee_LastPetzCrime;
// ---------------------------

INSTANCE DIA_Lee_PMSchulden (C_INFO)
{
	npc         = Sld_800_Lee;
	nr          = 1;
	condition   = DIA_Lee_PMSchulden_Condition;
	information = DIA_Lee_PMSchulden_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Lee_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Lee_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Lee_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lee_PMSchulden_Info()
{
				if (Kapitel >= 3)
				&& (Lee_Teleport == FALSE)
				{
					B_Lee_Teleport();
				};
	
	
	AI_Output (self, other, "DIA_Lee_PMSchulden_04_00"); //¿Has venido a traerle dinero a Onar?

	if (B_GetTotalPetzCounter(self) > Lee_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_01"); //Ya te dije que no hicieras ninguna estupidez.
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_02"); //Onar ha oído que tu historial ha aumentado.
		if (Lee_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_03"); //Por lo tanto, ahora quiere más dinero.
			AI_Output (other, self, "DIA_Lee_PMAdd_15_00"); //¿Cuánto?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Lee_LastPetzCounter);
		
			if (diff > 0)
			{
				Lee_Schulden = Lee_Schulden + (diff * 50);
			};
		
			if (Lee_Schulden > 1000)	{	Lee_Schulden = 1000;	};
		
			B_Say_Gold (self, other, Lee_Schulden);
		}
		else
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_04"); //Creí que eras más listo.
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Lee_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_05"); //Entonces tengo buenas noticias para ti.
		
		if (Lee_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_06"); //De repente, no queda nadie que te viera cometer el asesinato.
		};
		
		if (Lee_LastPetzCrime == CRIME_THEFT)
		|| ( (Lee_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_07"); //Nadie testificará que te vio robar.
		};
		
		if (Lee_LastPetzCrime == CRIME_ATTACK)
		|| ( (Lee_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_08"); //Ya no hay nadie que te VIERA zurrando a los granjeros.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_09"); //Por lo que parece, todos los cargos contra ti se han esfumado.
		};
		
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_10"); //Ésa es una manera de encargarse de ese tipo de problemas.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_11"); //De cualquier manera, ya no tienes que pagar.
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_12"); //Pero ten más cuidado en el futuro.
	
			Lee_Schulden			= 0;
			Lee_LastPetzCounter 	= 0;
			Lee_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_13"); //Una cosa está clara: a pesar de todo, tendrás que pagar todas tus multas.
			B_Say_Gold (self, other, Lee_Schulden);
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_14"); //Bueno, ¿y qué pasa?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Lee_PMSchulden);
		Info_ClearChoices  	(DIA_Lee_PETZMASTER);
		Info_AddChoice		(DIA_Lee_PMSchulden,"¡No tengo bastante oro!",DIA_Lee_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Lee_PMSchulden,"¿Dime otra vez cuánto era?",DIA_Lee_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
		{
			Info_AddChoice 	(DIA_Lee_PMSchulden,"¡Quiero pagar la multa!",DIA_Lee_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Lee_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Lee_PMSchulden_HowMuchAgain_15_00"); //¿Y cuánto era?
	B_Say_Gold (self, other, Lee_Schulden);

	Info_ClearChoices  	(DIA_Lee_PMSchulden);
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_AddChoice		(DIA_Lee_PMSchulden,"¡No tengo bastante oro!",DIA_Lee_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Lee_PMSchulden,"¿Dime otra vez cuánto era?",DIA_Lee_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice 	(DIA_Lee_PMSchulden,"¡Quiero pagar la multa!",DIA_Lee_PETZMASTER_PayNow);
	};
};

// ### weitere Choices siehe unten (DIA_Lee_PETZMASTER) ###


// ************************************************************
// 			  			 PETZ-MASTER 
// ************************************************************

instance DIA_Lee_PETZMASTER   (C_INFO)
{
	npc         = Sld_800_Lee;
	nr          = 1;
	condition   = DIA_Lee_PETZMASTER_Condition;
	information = DIA_Lee_PETZMASTER_Info;
	permanent   = TRUE;
	important	= TRUE;
};
FUNC INT DIA_Lee_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Lee_LastPetzCrime)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_PETZMASTER_Info()
{
				if (Kapitel >= 3)
				&& (Lee_Teleport == FALSE)
				{
					B_Lee_Teleport();
				};
	
	
	Lee_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	// ------ SC hat mit Lee noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_00"); //¿QUIÉN diablos te ha dejado entrar¿ (Sorprendido) ¿ERES el tipo nuevo que ha estado causando tantos problemas?
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_01"); //Gorn me dijo que aún estabas vivo, pero que vendrías... de todas maneras...
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_02"); //Me alegro de que hayas venido a verme antes de que las cosas se te pusieran peor.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_03"); //Los mercenarios son tipos duros y los granjeros de por aquí no son precisamente delicados, pero no puedes ir matando a la gente.
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Lee_Schulden = Lee_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_Farm_Theft + PETZCOUNTER_Farm_Attack + PETZCOUNTER_Farm_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_04"); //Por no hablar de las demás maldades a las que te has dedicado.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_05"); //Te puedo ayudar a salir limpio de este embrollo.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_06"); //Aunque te va a costar. Onar es un hombre avaricioso y solo se olvidará el asunto si ÉL hace la vista gorda.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_07"); //Me alegra que hayas venido. He oído que robaste algo por aquí.
		if (PETZCOUNTER_Farm_Attack > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_08"); //Y les zumbaste a los granjeros.
		};
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_09"); //Y mataste unas cuantas ovejas.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_10"); //Pero no puedes hacer esas cosas por aquí. En estos casos, Onar insiste en que haga pagar al culpable.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_11"); //Eso significa que tú pagas y él se llena los bolsillos, pero el asunto se acaba olvidando.
		
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_12"); //Una cosa es que te batas un duelo con los mercenarios...
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_13"); //Pero si le zumbas a un granjero, irá corriendo a decírselo a Onar. Y él espera que yo haga algo.
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_14"); //Por no hablar de que no le gusta especialmente que alguien mate a sus ovejas.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_15"); //Tendrás que pagar una multa. Por lo general, Onar se queda el dinero, pero es la única manera de zanjar el asunto.
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_16"); //Onar cuenta con que yo proteja su granja. Y eso incluye a las ovejas.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_17"); //¡Tendrás que pagarle una indemnización!
		
		Lee_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Lee_PETZMASTER_15_18"); //¿Cuánto?
	
	if (Lee_Schulden > 1000)	{	Lee_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Lee_Schulden);
	
	Info_ClearChoices  	(DIA_Lee_PMSchulden);
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_AddChoice		(DIA_Lee_PETZMASTER,"¡No tengo bastante oro!",DIA_Lee_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice 	(DIA_Lee_PETZMASTER,"¡Quiero pagar la multa!",DIA_Lee_PETZMASTER_PayNow);
	};
};

func void DIA_Lee_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Lee_PETZMASTER_PayNow_15_00"); //¡Quiero pagar la multa!
	B_GiveInvItems (other, self, itmi_gold, Lee_Schulden);
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayNow_04_01"); //¡Bien! Me encargaré de que el dinero le llegue a Onar. Puedes olvidarte del asunto.

	B_GrantAbsolution (LOC_FARM);
	
	Lee_Schulden			= 0;
	Lee_LastPetzCounter 	= 0;
	Lee_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_ClearChoices  	(DIA_Lee_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Lee_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Lee_PETZMASTER_PayLater_15_00"); //¡No tengo oro suficiente!
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayLater_04_01"); //Entonces ve a conseguirlo cuanto antes.
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayLater_04_02"); //Pero no esperes poder robarlo en la granja. Si te pillan, las cosas se te pondrán aún peor.
	
	Lee_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Lee_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				 Hallo 
// ************************************************************
INSTANCE DIA_Lee_Hallo   (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 1;
	condition   = DIA_Lee_Hallo_Condition;
	information = DIA_Lee_Hallo_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Lee_Hallo_Condition()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Hallo_Info()
{
	AI_Output (self, other, "DIA_Lee_Hallo_04_00"); //¿Quién diablos TE ha dejado entrar? (Sorprendido) ¿Qué haces aquí? ¡Creí que estabas muerto!
	AI_Output (other, self, "DIA_Lee_Hallo_15_01"); //¿Qué te hace pensar eso?
	AI_Output (self, other, "DIA_Lee_Hallo_04_02"); //Gorn me dijo que fuiste tú el que acabó con la barrera.
	AI_Output (other, self, "DIA_Lee_Hallo_15_03"); //Sí, era yo, es cierto.
	AI_Output (self, other, "DIA_Lee_Hallo_04_04"); //Nunca imaginé que nadie pudiera sobrevivir a algo así. ¿Qué te trae por aquí? No estás aquí por casualidad...
};

// ************************************************************
// 			  				Paladine 
// ************************************************************
INSTANCE DIA_Lee_Paladine   (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 2;
	condition   = DIA_Lee_Paladine_Condition;
	information = DIA_Lee_Paladine_Info;
	permanent   = FALSE;
	description = "Es fundamental que hable con los paladines de la ciudad.";
};
FUNC INT DIA_Lee_Paladine_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Paladine_Info()
{
	AI_Output (other, self, "DIA_Lee_Paladine_15_00"); //Es fundamental que hable con los paladines de la ciudad. ¿Puedes ayudarme a llegar hasta ellos?
	AI_Output (self, other, "DIA_Lee_Paladine_04_01"); //(Suspicaz) ¿Qué tienes que tratar con los paladines?
	AI_Output (other, self, "DIA_Lee_Paladine_15_02"); //Ésa es una larga historia.
	AI_Output (self, other, "DIA_Lee_Paladine_04_03"); //Tengo tiempo.
	AI_Output (other, self, "DIA_Lee_Paladine_15_04"); //(Suspiras) Xardas me ha enviado a un misión. Quiere que consiga un poderoso amuleto, el Ojo de Innos.
	AI_Output (self, other, "DIA_Lee_Paladine_04_05"); //Así que todavía estás aliado con el nigromante. Ya veo. ¿Y los paladines tienen ese amuleto?
	AI_Output (other, self, "DIA_Lee_Paladine_15_06"); //Por lo que yo sé, sí.
	AI_Output (self, other, "DIA_Lee_Paladine_04_07"); //Te puedo ayudar a llegar hasta los paladines. Pero antes tienes que convertirte en uno de nosotros.
};

// ************************************************************
// 			  				PaladineHOW
// ************************************************************
INSTANCE DIA_Lee_PaladineHOW (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 3;
	condition   = DIA_Lee_PaladineHOW_Condition;
	information = DIA_Lee_PaladineHOW_Info;
	permanent   = FALSE;
	description = "¿Cómo lo harás?";
};
FUNC INT DIA_Lee_PaladineHOW_Condition()
{
	if (other.guild == GIL_NONE)
	&& (Npc_KnowsInfo (other, DIA_Lee_Paladine))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_PaladineHOW_Info()
{
	AI_Output (other, self, "DIA_Lee_PaladineHOW_15_00"); //¿Cómo lo harás?
	AI_Output (self, other, "DIA_Lee_PaladineHOW_04_01"); //Confía en mí. Tengo un plan. Creo que eres la persona adecuada para ello...
	AI_Output (self, other, "DIA_Lee_PaladineHOW_04_02"); //Te llevaré con los paladines y me harás un favor. Pero antes de eso, ¡únete a nosotros!
};

// ************************************************************
// 			  				Lees Plan
// ************************************************************
INSTANCE DIA_Lee_LeesPlan (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 4;
	condition   = DIA_Lee_LeesPlan_Condition;
	information = DIA_Lee_LeesPlan_Info;
	permanent   = FALSE;
	description = "¿Qué es lo que estás haciendo aquí?";
};
FUNC INT DIA_Lee_LeesPlan_Condition()
{
	if (Lee_IsOnBoard == FALSE)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Lee_LeesPlan_Info()
{
	AI_Output (other, self, "DIA_Lee_LeesPlan_15_00"); //¿Qué es lo que estás haciendo aquí?
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_01"); //Muy simple: voy a encargarme de que todos salgamos de esta isla.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_02"); //Onar nos contrató para defender su granja y eso es exactamente lo que vamos a hacer.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_03"); //Pero nuestra recompensa es más que la simple paga. Al ayudar a los granjeros, cortamos el abastecimiento de la ciudad.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_04"); //Y cuanto menos comida tengan los paladines, antes nos harán caso cuando les hagamos una propuesta de paz.

	if ((hero.guild == GIL_MIL)||(hero.guild == GIL_PAL))
	{
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_05"); //Es una pena que hayas tenido que unirte precisamente a ellos.
	};

	AI_Output (other, self, "DIA_Lee_LeesPlan_15_06"); //¿Y cómo va a ser vuestra propuesta?
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_07"); //Básicamente consiste en nuestro perdón y un salvoconducto para llegar al continente. Sabrás más cuando llegue el momento.
};

// ************************************************************
// 			  				Wanna Join
// ************************************************************
INSTANCE DIA_Lee_WannaJoin (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 5;
	condition   = DIA_Lee_WannaJoin_Condition;
	information = DIA_Lee_WannaJoin_Info;
	permanent   = FALSE;
	description = "¡Quiero unirme a vosotros!";
};
FUNC INT DIA_Lee_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_WannaJoin_Info()
{
	AI_Output (other, self, "DIA_Lee_WannaJoin_15_00"); //¡Quiero unirme a vosotros!
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_01"); //¡Esperaba que dijeras eso! Todo hombre apto nos viene bien.
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_02"); //¡Los últimos mercenarios que acepté no hacen más que crear problemas!
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_03"); //En principio, puedes empezar ya. Bueno, antes tenemos que solucionar un par de cosas, pero nada importante...
};

// ************************************************************
// 			  				ClearWhat
// ************************************************************
INSTANCE DIA_Lee_ClearWhat (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 6;
	condition   = DIA_Lee_ClearWhat_Condition;
	information = DIA_Lee_ClearWhat_Info;
	permanent   = FALSE;
	description = "¿De qué tengo que ''encargarme'' antes de que pueda unirme a ti?";
};
FUNC INT DIA_Lee_ClearWhat_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lee_WannaJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_ClearWhat_Info()
{
	AI_Output (other, self, "DIA_Lee_ClearWhat_15_00"); //¿Qué tengo que ''solucionar'' antes de que pueda unirme a ti?
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_01"); //Onar, el terrateniente, es nuestro patrón. Solo puedes quedarte en la granja si él da el visto bueno.
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_02"); //Y luego están los chicos. Solo puedo aceptarte si la mayoría de los mercenarios están de acuerdo con que te unas.
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_03"); //Pero no vayas a ver a Onar antes de que esté todo arreglado. Es un tipo muy impaciente...
	
	Log_CreateTopic (TOPIC_BecomeSLD,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BecomeSLD,LOG_RUNNING);
	B_LogEntry (TOPIC_BecomeSLD,"Para que me acepten como mercenario, necesito convencer a los propios mercenarios y la aprobación de Onar.");
};

// ************************************************************
// 			  				OtherSld
// ************************************************************
INSTANCE DIA_Lee_OtherSld (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 7;
	condition   = DIA_Lee_OtherSld_Condition;
	information = DIA_Lee_OtherSld_Info;
	permanent   = FALSE;
	description = "¿Cómo puedo convencer a los mercenarios de que me voten?";
};
FUNC INT DIA_Lee_OtherSld_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lee_WannaJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_OtherSld_Info()
{
	AI_Output (other, self, "DIA_Lee_OtherSld_15_00"); //¿Cómo puedo convencer a los mercenarios de que me voten?
	AI_Output (self, other, "DIA_Lee_OtherSld_04_01"); //Yo diría que haciendo lo que se espera de ti, como mercenario.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_02"); //Habla con Torlof. Suele estar fuera, en frente de la casa. Él te pondrá a prueba.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_03"); //Si la superas, te habrás ganado buena parte del respeto que te hace falta.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_04"); //Él te dirá todo lo que necesites saber.
	
	B_LogEntry (TOPIC_BecomeSLD,"Para que me acepten como mercenario, tengo que dejar que Torlof me ponga a prueba y ganarme el respeto de los demás mercenarios.");
};
			
///////////////////////////////////////////////////////////////////////
//	Info Ranger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lee_Ranger		(C_INFO)
{
	npc		 = 	SLD_800_Lee;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Lee_Ranger_Condition;
	information	 = 	DIA_Addon_Lee_Ranger_Info;

	description	 = 	"¿Qué sabes sobre el 'Anillo de Agua'?";
};

func int DIA_Addon_Lee_Ranger_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Lee_OtherSld))
	&& (SC_KnowsRanger == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Lee_Ranger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lee_Ranger_15_00"); //¿Qué sabes sobre el 'Anillo de Agua'?
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_01"); //(ríe) Tendría que habérmelo imaginado. Tienes que meterte en todo, ¿verdad?
	AI_Output	(other, self, "DIA_Addon_Lee_Ranger_15_02"); //Vamos, cuéntame.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_03"); //Tengo poco que ver en el asunto. Sé que su gremio secreto está aquí y que los Magos de Agua están involucrados.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_04"); //Desde que cayó la Barrera, ya no estoy vinculado al acuerdo al que llegué por aquél entonces con los Magos de Agua.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_05"); //Sigo ayudando siempre que puedo, claro está. Pero la mayor parte del tiempo me es suficiente con mis propios problemas.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_06"); //Si quieres saber más, deberías ir a hablar con Cord. Es uno de ellos, por lo que sé.
		
	RangerHelp_gildeSLD = TRUE;	
	SC_KnowsCordAsRangerFromLee = TRUE;
};			
			
// ************************************************************
// 			  				JoinNOW
// ************************************************************
var int Lee_ProbeOK;
var int Lee_StimmenOK;
var int Lee_OnarOK;

INSTANCE DIA_Lee_JoinNOW (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 8;
	condition   = DIA_Lee_JoinNOW_Condition;
	information = DIA_Lee_JoinNOW_Info;
	permanent   = TRUE;
	description = "¡Estoy listo para unirme a ti!";
};
FUNC INT DIA_Lee_JoinNOW_Condition()
{
	if (other.guild == GIL_NONE)
	&& (Npc_KnowsInfo (other, DIA_Lee_OtherSld))
	&& (Lee_OnarOK == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_JoinNOW_Info()
{
	AI_Output (other, self, "DIA_Lee_JoinNOW_15_00"); //¡Estoy listo para unirme a vosotros!
		
	// ------ Probe ------
	if (Lee_ProbeOK == FALSE)
	{
		if (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS)
		&& (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_01"); //No antes de que superes la prueba de Torlof.
		}
		else //Probe bestanden
		{			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_02"); //¿Pasaste tú la prueba de Torlof?
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_03"); //Sí.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_04"); //Muy bien.
			Lee_ProbeOK = TRUE;
		};
	};
	
	// ------ Stimmen -------
	if (Lee_ProbeOK == TRUE)
	&& (Lee_StimmenOK == FALSE)
	{
		AI_Output (self, other, "DIA_Lee_JoinNOW_04_05"); //¿Qué dicen los demás mercenarios?
		if (Torlof_GenugStimmen == FALSE)
		{
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_06"); //No estoy muy seguro de tener suficientes de mi lado.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_07"); //Entonces habla con Torlof. Él sabe casi todo lo que se dice en la granja.
		}
		else //genug Stimmen
		{
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_08"); //La mayoría está de mi lado.
			Lee_StimmenOK = TRUE;
		};	
	};

	// ------ Onar ------	
	if (Lee_StimmenOK == TRUE)
	&& (Lee_OnarOK == FALSE)
	{		
		if (Onar_Approved == FALSE)
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_09"); //Bien, entonces ve a ver a Onar. Ya he hablado con él.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_10"); //Pero tendrás que negociar la paga.
			Lee_SendToOnar = TRUE;
			B_LogEntry (TOPIC_BecomeSLD,"Todo lo que necesito es la aprobación de Onar.");
		}
		else //Onar ist einverstanden
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_11"); //¿Has visto a Onar?
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_12"); //Está de acuerdo.
			Lee_OnarOK = TRUE;
			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_13"); //¡Bienvenido a bordo, compañero!
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_14"); //Toma, ¡antes de nada, ponte una armadura decente!
			Npc_SetTrueGuild (other, GIL_SLD);
			other.guild = GIL_SLD;
			Npc_ExchangeRoutine (Lothar, "START");
			
			CreateInvItems (other, ItAr_Sld_L, 1);
			AI_EquipArmor (other, ItAr_Sld_L);
						
			Snd_Play ("LEVELUP"); 
	
			KDF_Aufnahme = LOG_OBSOLETE;
			SLD_Aufnahme = LOG_SUCCESS;
			MIL_Aufnahme = LOG_OBSOLETE;
			B_GivePlayerXP (XP_BecomeMercenary);
			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_15"); //Me alegra tenerte con nosotros.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_16"); //Ya tengo tu primera misión.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_17"); //Tiene que ver con los paladines. Es hora de que vayas a verlos.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_18"); //De todas maneras querías ir allí.
		};
	};
};

// ************************************************************
// 			  				KEIN SLD
// ************************************************************
INSTANCE DIA_Lee_KeinSld (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 4;
	condition   = DIA_Lee_KeinSld_Condition;
	information = DIA_Lee_KeinSld_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Lee_KeinSld_Condition()
{
	if ( (other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF) )
	&& (Lee_IsOnBoard == FALSE)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KeinSld_Info()
{
	if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Lee_KeinSld_04_00"); //Veo que te has puesto al servicio de los paladines.
	}
	
	if (other.guild == GIL_NOV) || (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Lee_KeinSld_04_01"); //¿Entraste en el monasterio? (Risas) Me habría esperado cualquier cosa menos eso..
	};
	
	AI_Output (self, other, "DIA_Lee_KeinSld_04_02"); //Bueno, ya no puedes convertirte en mercenario.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_03"); //Pero, quién sabe, quizá puedas hacer un par de cosas por mí. O yo por ti.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_04"); //Ya veremos. De todas maneras, te deseo lo mejor.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_05"); //Pero ni se te ocurra darme gato por liebre, ¿vale?
};

// ************************************************************
// 			  				ToHagen
// ************************************************************
INSTANCE DIA_Lee_ToHagen(C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 4;
	condition   = DIA_Lee_ToHagen_Condition;
	information = DIA_Lee_ToHagen_Info;
	permanent   = FALSE;
	description = "¿Y ahora cómo llego hasta los paladines?";
};
FUNC INT DIA_Lee_ToHagen_Condition()
{
	if (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_ToHagen_Info()
{
	AI_Output (other, self, "DIA_Lee_ToHagen_15_00"); //¿Y ahora cómo llego hasta los paladines?
	AI_Output (self, other, "DIA_Lee_ToHagen_04_01"); //Es sencillo. Les llevarás nuestra propuesta de paz.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_02"); //Conozco a lord Hagen, el comandante de los paladines, de mis tiempos en el ejército real.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_03"); //Sé lo que piensa, no tiene los hombres necesarios. Aceptará la propuesta. Al menos, te escuchará.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_04"); //He escrito una carta. Ten.
	B_GiveInvItems (self,other,ItWr_Passage_MIS,1);
	AI_Output (self, other, "DIA_Lee_ToHagen_04_05"); //En cualquier caso, esto debería permitirte llegar hasta el líder de los paladines.
		
	MIS_Lee_Friedensangebot = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Frieden,LOG_MISSION);
	Log_SetTopicStatus (Topic_Frieden,LOG_RUNNING);
	B_LogEntry (Topic_Frieden,"Lee me envía para que le haga una propuesta de paz a lord Hagen. De esa manera podré llegar hasta los paladines.");
};
		
// ************************************************************
// 			  			AngebotSuccess
// ************************************************************
INSTANCE DIA_Lee_AngebotSuccess (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 1;
	condition   = DIA_Lee_AngebotSuccess_Condition;
	information = DIA_Lee_AngebotSuccess_Info;
	permanent   = FALSE;
	description = "Le he llevado a lord Hagen tu oferta de paz.";
};
FUNC INT DIA_Lee_AngebotSuccess_Condition()
{
	if (Hagen_FriedenAbgelehnt == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_AngebotSuccess_Info()
{
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_00"); //Le he llevado a lord Hagen tu propuesta de paz.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_01"); //¿Qué fue lo que te dijo?
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_02"); //Me dijo que te daría el indulto a ti, pero no a tu gente.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_03"); //Idiota testarudo. La mayoría de los hombres del ejército del REY son asesinos peores que mis hombres.
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_04"); //¿Qué vas a hacer ahora?
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_05"); //Tengo que encontrar otra manera de sacarnos de aquí. Si es necesario, me haré con el barco. Tengo que pensar en ello.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_06"); //Lo que ni me planteo es salvar el cuello y abandonar a mis hombres.

	MIS_Lee_Friedensangebot = LOG_SUCCESS;
};

// ************************************************************
// 			  			Background
// ************************************************************
INSTANCE DIA_Lee_Background (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 1;
	condition   = DIA_Lee_Background_Condition;
	information = DIA_Lee_Background_Info;
	permanent   = FALSE;
	description = "¿Por qué estás tan deseoso de ir al continente?";
};
FUNC INT DIA_Lee_Background_Condition()
{
	if (MIS_Lee_Friedensangebot == LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Background_Info()
{
	AI_Output (other, self, "DIA_Lee_Add_15_10"); //¿Por qué estás tan deseoso de ir al continente?
	AI_Output (self ,other, "DIA_Lee_Add_04_11"); //Como sabes, serví al Rey como general.
	AI_Output (self ,other, "DIA_Lee_Add_04_12"); //Pero sus aduladores me traicionaron, porque sabía algo que no debía saber.
	AI_Output (self ,other, "DIA_Lee_Add_04_13"); //Me metieron en la colonia minera y el Rey lo permitió.
	AI_Output (self ,other, "DIA_Lee_Add_04_14"); //He tenido mucho tiempo para pensar en ello.
	AI_Output (self ,other, "DIA_Lee_Add_04_15"); //Me vengaré.
	AI_Output (other, self, "DIA_Lee_Add_15_16"); //(Asombrado) ¿Del Rey?
	AI_Output (self ,other, "DIA_Lee_Add_04_17"); //(Con determinación) ¡Del Rey! Y de toda su camarilla. Lamentarán todo lo que me hicieron...
};

// ************************************************************
// 			  		RescueGorn
// ************************************************************
INSTANCE DIA_Lee_RescueGorn (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 2;
	condition   = DIA_Lee_RescueGorn_Condition;
	information = DIA_Lee_RescueGorn_Info;
	permanent   = FALSE;
	description = "Voy a dirigirme al Valle de las Minas.";
};
FUNC INT DIA_Lee_RescueGorn_Condition()
{
	if (Hagen_BringProof == TRUE)
	&& (Kapitel < 3)
	&& (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_RescueGorn_Info()
{
	AI_Output (other, self, "DIA_Lee_RescueGorn_15_00"); //Voy a dirigirme al Valle de las Minas.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_01"); //No pensé que te fueras a quedar mucho tiempo con los granjeros.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_02"); //Si vuelves a la colonia, intenta hacer algo por Gorn. Los paladines lo tienen preso.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_03"); //Gorn es un buen hombre y podría serme muy útil, así que si te presenta la oportunidad de liberarlo, hazlo.
	
	KnowsAboutGorn = TRUE;
};
// ************************************************************
// 			 RescueGorn Success
// ************************************************************
INSTANCE DIA_Lee_Success (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 2;
	condition   = DIA_Lee_Success_Condition;
	information = DIA_Lee_Success_Info;
	permanent   = FALSE;
	description = "He liberado a Gorn.";
};
FUNC INT DIA_Lee_Success_Condition()
{
	if (MIS_RescueGorn == LOG_SUCCESS)
	&& (Kapitel >= 3)
	&& (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Success_Info()
{
	AI_Output (other, self, "DIA_Lee_Success_15_00"); //He liberado a Gorn.
	AI_Output (self, other, "DIA_Lee_Success_04_01"); //Sí, ya me lo ha dicho. Buen trabajo.
	AI_Output (self, other, "DIA_Lee_Success_04_02"); //Vale más que Sylvio y todos sus hombres juntos.
	
	B_GivePlayerXP (XP_Ambient);
	
};
// ************************************************************
// 			  				AboutGorn
// ************************************************************
INSTANCE DIA_Lee_AboutGorn (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 5;
	condition   = DIA_Lee_AboutGorn_Condition;
	information = DIA_Lee_AboutGorn_Info;
	permanent   = FALSE;
	description = "¿¿Gorn te habló de mí?? ¿Qué le ha pasado?";
};
FUNC INT DIA_Lee_AboutGorn_Condition()
{
	if (Kapitel < 3) 
	&& (Npc_KnowsInfo (other,DIA_Lee_RescueGorn) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_AboutGorn_Info()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_15_00"); //¿¿Gorn te habló de mí?? ¿Qué le ha pasado?
	AI_Output (self, other, "DIA_Lee_AboutGorn_04_01"); //Le recuerdas, ¿verdad?
	
	Info_ClearChoices (DIA_Lee_AboutGorn);
	Info_AddChoice (DIA_Lee_AboutGorn, "Déjame pensar...", DIA_Lee_AboutGorn_Who);
	Info_AddChoice (DIA_Lee_AboutGorn, "Claro.", DIA_Lee_AboutGorn_Yes);
};

func void DIA_Lee_AboutGorn_Yes()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_Yes_15_00"); //Claro.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_01"); //Los paladines le cogieron y le enviaron de vuelta al Valle de las Minas, en una expedición penal.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_02"); //Si el camino que lleva al Valle de las Minas no estuviera sembrado de orcos y paladines, ya habría enviado un par de chicos para liberarlo.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_03"); //Pero tal y como están las cosas, no tiene sentido. Pobre hombre.
	Info_ClearChoices (DIA_Lee_AboutGorn);
};

func void DIA_Lee_AboutGorn_Who()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_Who_15_00"); //Déjame pensar...
	AI_Output (self, other, "DIA_Lee_AboutGorn_Who_04_01"); //Grande, moreno, malo, con un hacha enorme... junto a ti reconquistó nuestra mina cuando estábamos en la colonia.
};

// ************************************************************
// 			  				WegenBullco
// ************************************************************
INSTANCE DIA_Lee_WegenBullco (C_INFO)
{
	npc         = SLD_800_Lee;
	nr          = 6;
	condition   = DIA_Lee_WegenBullco_Condition;
	information = DIA_Lee_WegenBullco_Info;
	permanent   = FALSE;
	description = "Ahora Onar tiene unas cuantas ovejas menos, gracias a Bullco...";
};
FUNC INT DIA_Lee_WegenBullco_Condition()
{
	if (Kapitel < 4) 
	&& (MIS_Pepe_KillWolves == LOG_SUCCESS)
	&& (Onar_WegenPepe == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_WegenBullco_Info()
{
	AI_Output (other, self, "DIA_Lee_Add_15_00"); //Ahora Onar tiene unas cuantas ovejas menos, gracias a Bullco...
	AI_Output (self ,other, "DIA_Lee_Add_04_01"); //Oh, ¡déjame en paz! Ya tengo suficientes problemas.
	if (Bullco_scharf == TRUE)
	&& (!Npc_IsDead(Bullco))
	{
		AI_Output (other, self, "DIA_Lee_Add_15_02"); //Yo también. Bullco parece tener un problema conmigo. Quiere que me vaya de la granja...
		AI_Output (self ,other, "DIA_Lee_Add_04_03"); //Sí, ¿y? Defiéndete tú mismo.
		AI_Output (self ,other, "DIA_Lee_Add_04_04"); //Puedes decirle que debería controlarse, o que deduciré las ovejas perdidas de su paga...
	};
};


//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

// ************************************************************
// 							Drachen Report
// ************************************************************
instance DIA_Lee_Report (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_Report_Condition;
	information	= DIA_Lee_Report_Info;
	permanent	= TRUE;
	description = "Vengo del Valle de las Minas.";
};                       
FUNC INT DIA_Lee_Report_Condition()
{
	if (EnterOW_Kapitel2 == TRUE)
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Report_Info()
{	
	AI_Output (other, self, "DIA_Lee_Add_15_18"); //Vengo del Valle de las Minas. ¡El castillo está siendo atacado por dragones!
	AI_Output (self ,other, "DIA_Lee_Add_04_19"); //¡Así que es verdad! Lares dijo que había rumores de dragones circulando por la ciudad... no me lo creí...
	AI_Output (self ,other, "DIA_Lee_Add_04_20"); //¿Qué hay de los paladines?
	AI_Output (other, self, "DIA_Lee_Add_15_21"); //Están diezmados.
	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other, "DIA_Lee_Add_04_22"); //¡Bien! Quizá ahora lord Hagen se piense mejor mi propuesta...
		AI_Output (self ,other, "DIA_Lee_Add_04_23"); //Y si no... (con dureza) entonces encontraré otra forma de salir de aquí...
	}
	else
	{
		AI_Output (self ,other, "DIA_Lee_Add_04_24"); //¡Bien! Puede que esto haga que lord Hagen salga para el Valle de las Minas con sus hombres.
		AI_Output (self ,other, "DIA_Lee_Add_04_25"); //Cuantos menos paladines se queden, mejor.
	};
};

// ************************************************************
// 							Armor M freischalten
// ************************************************************

var int Lee_Give_Sld_M;
// -----------------------

instance DIA_Lee_ArmorM (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_ArmorM_Condition;
	information	= DIA_Lee_ArmorM_Info;
	permanent	= TRUE;
	description = "¿Y qué hay de una armadura mejor?";
};                       
FUNC INT DIA_Lee_ArmorM_Condition()
{
	if (Kapitel == 2)
	&& (other.guild == GIL_SLD)
	&& (Lee_Give_Sld_M == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_ArmorM_Info()
{	
	AI_Output (other,self ,"DIA_Lee_ArmorM_15_00"); //¿Y qué hay de una armadura mejor?
	
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	&& (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_01"); //Has cumplido con tu misión.
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_02"); //Aquí tengo una armadura mejor, para ti. Siempre que tengas los medios.
		
		Lee_Give_Sld_M = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_03"); //Torlof tiene un encargo de Onar que se tendría que haber hecho hace tiempo.
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_04"); //Ocúpate de ello, ¡y luego hablaremos de la armadura!
	};
};

// ************************************************************
// 							Armor M kaufen
// ************************************************************
var int Lee_SldMGiven;
// -------------------

instance DIA_Lee_BuyArmorM (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_BuyArmorM_Condition;
	information	= DIA_Lee_BuyArmorM_Info;
	permanent	= TRUE;
	description = "Comprar armadura intermedia. Protección: armas 45, flechas 45. Precio: 500.";
};                       
FUNC INT DIA_Lee_BuyArmorM_Condition()
{
	if (Lee_Give_Sld_M == TRUE)
	&& (Lee_SldMGiven == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_BuyArmorM_Info()
{	
	AI_Output (other,self ,"DIA_Lee_BuyArmorM_15_00"); //Dame la armadura.
	
	if (B_GiveInvItems (other, self, itmi_gold, 1000))
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorM_04_01"); //Toma. Una buena armadura.
		//B_GiveInvItems (self, other, itar_sld_M, 1);
		CreateInvItems (other, ItAr_Sld_M, 1);
		AI_EquipArmor (other, ItAr_Sld_M);
			
		Lee_SldMGiven = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorM_04_02"); //¡Pero no es gratis! ¡Antes quiero ver algo de oro!
	};
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

INSTANCE DIA_Lee_KAP3_EXIT(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 999;
	condition	= DIA_Lee_KAP3_EXIT_Condition;
	information	= DIA_Lee_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lee_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  				  		Teleport
// ************************************************************

INSTANCE DIA_Lee_Teleport(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 1;
	condition	= DIA_Lee_Teleport_Condition;
	information	= DIA_Lee_Teleport_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Lee_Teleport_Condition()
{
	if (Kapitel >= 3)
	&& (Npc_IsInState (self, ZS_Talk))
	&& (Lee_Teleport == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Teleport_Info()
{	
	 B_Lee_Teleport();
};

// ************************************************************
// 							Armor H freischalten
// ************************************************************

instance DIA_Lee_ArmorH (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_ArmorH_Condition;
	information	= DIA_Lee_ArmorH_Info;
	permanent	= FALSE;
	description = "¿Tienes una armadura mejor para mí?";
};                       
FUNC INT DIA_Lee_ArmorH_Condition()
{
	if (Kapitel == 3)
	&& ( (other.guild == GIL_SLD) || (other.guild == GIL_DJG) )
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_ArmorH_Info()
{	
	AI_Output (other,self ,"DIA_Lee_ArmorH_15_00"); //¿Tienes una armadura mejor para mí?
	AI_Output (self ,other,"DIA_Lee_ArmorH_04_01"); //Claro que sí.
};

// ************************************************************
// 							Armor H kaufen
// ************************************************************
var int Lee_SldHGiven;
// -------------------

instance DIA_Lee_BuyArmorH (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_BuyArmorH_Condition;
	information	= DIA_Lee_BuyArmorH_Info;
	permanent	= TRUE;
	description = "Comprar armadura pesada. Protección: armas 60, flechas 60. Precio: 1000.";
};                       
FUNC INT DIA_Lee_BuyArmorH_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lee_ArmorH))
	&& (Lee_SldHGiven == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_BuyArmorH_Info()
{	
	AI_Output (other,self ,"DIA_Lee_BuyArmorH_15_00"); //Dame una armadura pesada.
	
	if (B_GiveInvItems (other, self, itmi_gold, 2500))
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorH_04_01"); //Toma. Una armadura muy buena. Es la que yo llevo.
		//CreateInvItems (self,itar_sld_H,1);
		//B_GiveInvItems (self, other, itar_sld_H, 1);
		
		CreateInvItems (other, ItAr_Sld_H, 1);
		AI_EquipArmor (other, ItAr_Sld_H);
		
		Lee_SldHGiven = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorH_04_02"); //Ya sabes cómo va esto. ¡Primero el oro!
	};
};


// ************************************************************
// 	Richter
// ************************************************************

INSTANCE DIA_Lee_Richter (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_Richter_Condition;
	information	= DIA_Lee_Richter_Info;
	permanent	= FALSE;
	description = "¿No tienes nada más que ordenarme?";
};                       
FUNC INT DIA_Lee_Richter_Condition()
{
	if (Kapitel >= 3)
	&& ((hero.guild == GIL_SLD)	|| (hero.guild == GIL_DJG))
	&& ((Npc_IsDead(Richter))== FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_Richter_Info()
{	
	AI_Output (other,self ,"DIA_Lee_Richter_15_00"); //¿No tienes nada más que ordenarme?
	AI_Output (self ,other,"DIA_Lee_Richter_04_01"); //No tienes suficiente, ¿eh? Ya tienes bastantes problemas. ¿Qué más quieres?
	AI_Output (other,self ,"DIA_Lee_Richter_15_02"); //Otra misión. Soy mercenario, ¿recuerdas?
	AI_Output (self ,other,"DIA_Lee_Richter_04_03"); //De acuerdo. Tengo algo perfecto para ti.
	AI_Output (self ,other,"DIA_Lee_Richter_04_04"); //Tengo que saldar una deuda con el juez de la ciudad. Preferiría hacerlo yo mismo.
	AI_Output (self ,other,"DIA_Lee_Richter_04_05"); //Pero los paladines no me dejarían acercarme a su casa.
	AI_Output (self ,other,"DIA_Lee_Richter_04_06"); //El asunto debe manejarse con cierto detenimiento. Presta atención. Irás a ver al juez y le ofrecerás tus servicios.
	AI_Output (self ,other,"DIA_Lee_Richter_04_07"); //Intentarás ganarte su confianza y harás su trabajo sucio, hasta que descubras algo que le incrimine.
	AI_Output (self ,other,"DIA_Lee_Richter_04_08"); //El muy canalla tiene tantos chanchullos que huele a cloaca.
	AI_Output (self ,other,"DIA_Lee_Richter_04_09"); //Tráeme algo que pueda usar para ensuciar su nombre frente a la milicia y hacer que se pase el resto de su vida en la trena.
	AI_Output (self ,other,"DIA_Lee_Richter_04_10"); //Pero no quiero que le mates. Eso sería demasiado rápido. Quiero que sufra, ¿comprendido?
	AI_Output (self ,other,"DIA_Lee_Richter_04_11"); //¿Crees que podrás hacerlo?
	
	
	Log_CreateTopic (TOPIC_RichterLakai, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RichterLakai, LOG_RUNNING);
	B_LogEntry (TOPIC_RichterLakai,"Lee quiere que encuentre algún tipo de prueba contra el juez de Khorinis. Para ello tendré que ofrecer mis servicios al juez y estar alerta."); 

	MIS_Lee_JudgeRichter = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Lee_Richter);
	Info_AddChoice	(DIA_Lee_Richter, "No voy a hacerlo.", DIA_Lee_Richter_nein );
	Info_AddChoice	(DIA_Lee_Richter, "Sin problema. ¿Cuánto?", DIA_Lee_Richter_wieviel );
};
func void DIA_Lee_Richter_wieviel ()
{
	AI_Output			(other, self, "DIA_Lee_Richter_wieviel_15_00"); //Sin problema. ¿Cuánto?
	AI_Output			(self, other, "DIA_Lee_Richter_wieviel_04_01"); //Tu recompensa dependerá de lo que consigas. Así que esfuérzate.
	Info_ClearChoices	(DIA_Lee_Richter);
};
func void DIA_Lee_Richter_nein ()
{
	AI_Output			(other, self, "DIA_Lee_Richter_nein_15_00"); //No voy a hacerlo. No voy a dejar que ese cerdo me pisotee.
	AI_Output			(self, other, "DIA_Lee_Richter_nein_04_01"); //No te quejes tanto. Después de todo es uno de los que te la jugaron y te metieron en la barrera. ¿O es que lo has olvidado?
	AI_Output			(self, other, "DIA_Lee_Richter_nein_04_02"); //Haz lo que quieras. Creo que tomarás la decisión correcta.
	Info_ClearChoices	(DIA_Lee_Richter);
};



// ************************************************************
// 	RichterBeweise
// ************************************************************

INSTANCE DIA_Lee_RichterBeweise (C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_RichterBeweise_Condition;
	information	= DIA_Lee_RichterBeweise_Info;

	description = "He encontrado algo que incrimina al juez.";
};                       
FUNC INT DIA_Lee_RichterBeweise_Condition()
{
	if (Kapitel >= 3)
	&& (MIS_Lee_JudgeRichter == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_RichterKomproBrief_MIS))
	&& ((hero.guild == GIL_SLD)	|| (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_RichterBeweise_Info()
{	
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_00"); //He encontrado algo que incrimina al juez.
	AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_01"); //¿De verdad? ¿Qué es?
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_02"); //Contrató a unos sicarios para asaltar al gobernador de Khorinis.
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_03"); //Poco después, hizo que los detuviesen y se quedó con todo el oro.
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_04"); //Te traigo como prueba la orden escrita que les dio a los matones.
	AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_05"); //Muéstramela.
	B_GiveInvItems (other, self, ItWr_RichterKomproBrief_MIS,1);
	B_UseFakeScroll();

	if  ((Npc_IsDead(Richter))== FALSE)
		{
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_06"); //Por fin. Esto debería bastar para hundirle. Estoy impresionado.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_07"); //Estoy dispuesto a ser muy generoso. Toma tu recompensa.
			CreateInvItems (self, ItMi_Gold, 500);									
			B_GiveInvItems (self, other, ItMi_Gold, 500);		
			MIS_Lee_JudgeRichter = LOG_SUCCESS;
			B_GivePlayerXP (XP_JudgeRichter);			
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_08"); //Y ni una palabra a nadie, ¿de acuerdo?
		}
	else
		{
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_09"); //Genial, pero el asunto se ha resuelto solo. El juez ha muerto.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_10"); //Algún idiota se lo cargó. Oh, bueno, por mí genial.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_11"); //Toma unas cuantas monedas. Es todo lo que vale para mí esa nota.
			CreateInvItems (self, ItMi_Gold, 50);									
			B_GiveInvItems (self, other, ItMi_Gold, 50);		
			MIS_Lee_JudgeRichter = LOG_FAILED;
			B_GivePlayerXP (XP_Ambient);			
		};
};

// ************************************************************
// 	  				   Was ist mit Bennet?
// ************************************************************

INSTANCE DIA_Lee_TalkAboutBennet(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_TalkAboutBennet_Condition;
	information	= DIA_Lee_TalkAboutBennet_Info;
	permanent	= FALSE;
	description = "¿Qué hay de Bennet?";
};                       
FUNC INT DIA_Lee_TalkAboutBennet_Condition()
{
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (KApitel == 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_TalkAboutBennet_Info()
{	
	AI_Output (other,self ,"DIA_Lee_TalkAboutBennet_15_00"); //¿Qué hay de Bennet?
	AI_Output (self ,other,"DIA_Lee_TalkAboutBennet_04_01"); //Así que te has enterado. Esos bastardos lo han encerrado.
	if ((hero.guild != GIL_MIL)&&(hero.guild != GIL_PAL))
	{
	AI_Output (self ,other,"DIA_Lee_TalkAboutBennet_04_02"); //Y si no tenía suficientes problemas con mi gente, ahora tengo que encargarme también de los paladines.
	};
};

//**************************************************************
//	Was willst du wegen Bennet unternehmen?
//**************************************************************

INSTANCE DIA_Lee_DoAboutBennet(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_DoAboutBennet_Condition;
	information	= DIA_Lee_DoAboutBennet_Info;
	permanent	= FALSE;
	description = "¿Qué harás con Bennet?";
};                       
FUNC INT DIA_Lee_DoAboutBennet_Condition()
{
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Lee_TalkAboutBennet))	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_DoAboutBennet_Info()
{	
	AI_Output (other,self ,"DIA_Lee_DoAboutBennet_15_00"); //¿Qué harás con respecto a Bennet?
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_01"); //Todavía no lo sé. Algunos de los chicos quieren asaltar la ciudad y hacer que lord Hagen se trague los dientes.
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_02"); //Por suerte, no tenemos gente suficiente para una operación así y, además, no es mi estilo.
	AI_Output (other,self ,"DIA_Lee_DoAboutBennet_15_03"); //Entonces ¿vas a esperar a ver qué pasa?
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_04"); //Por supuesto que no.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Si no puedo demostrar deprisa la inocencia de Bennet, a Lee no se le podrá responsabilizar de lo que pase. Su gente no va a tener reparos en atacar la ciudad para sacar a Bennet por la fuerza."); 
	
	if (!Npc_IsDead (Lares))
	{ 
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_05"); //Lares aún está en la ciudad e intenta encontrar la forma de liberar a Bennet.
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_06"); //Hasta que eso ocurra, intento calmar a mi gente. Espero que Lares no tarde demasiado.
	};
		
	if (!Npc_IsDead (Buster))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{ 
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_07"); //Oh, sí. Antes de que se me olvide... Buster quiere hablar contigo. No quiso decirme de qué. ¡Quizá deberías ir a verle!
	};
};

//**************************************************************
//	Kann ich dir helfen?
//**************************************************************

INSTANCE DIA_Lee_CanHelpYou(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_CanHelpYou_Condition;
	information	= DIA_Lee_CanHelpYou_Info;
	permanent	= FALSE;
	description = "¿Te puedo ayudar con este asunto de Bennet?";
};                       
FUNC INT DIA_Lee_CanHelpYou_Condition()
{
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo (other,DIA_Lee_DoAboutBennet))	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_CanHelpYou_Info()
{	
	AI_Output (other,self ,"DIA_Lee_CanHelpYou_15_00"); //¿Te puedo ayudar con este asunto de Bennet?
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_01"); //Claro, algo de inteligencia y cordura no vendría mal.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_02"); //Bien sabe Innos que ya hay suficientes idiotas por aquí.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_03"); //Ve a la ciudad a ver si descubres una forma de liberar a Bennet.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_04"); //Pero no tardes demasiado, no sé cuánto tiempo voy a tener a mis hombres bajo control.
};

//**************************************************************
//	Gibts was neues wegen Bennet?
//**************************************************************

//----------------------------------
var int DIA_Lee_AnyNews_OneTime;
//----------------------------------

INSTANCE DIA_Lee_AnyNews(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 3;
	condition	= DIA_Lee_AnyNews_Condition;
	information	= DIA_Lee_AnyNews_Info;
	permanent	= TRUE;
	description = "¿Alguna noticia de Bennet?";
};                       
FUNC INT DIA_Lee_AnyNews_Condition()
{
	if (MIS_RescueBennet != FALSE)
	&& (Npc_KnowsInfo (other,DIA_Lee_DoAboutBennet))
	&& (DIA_Lee_AnyNews_OneTime == FALSE) 	
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lee_AnyNews_Info()
{	
	AI_Output (other,self ,"DIA_Lee_AnyNews_15_00"); //¿Alguna noticia de Bennet?

	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_01"); //Al menos no parece que haya sufrido daños en la cárcel.
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_02"); //Buen trabajo.

		if (DIA_Lee_AnyNews_OneTime == FALSE)
		{
			B_GivePlayerXP (XP_AMBIENT);
			DIA_Lee_AnyNews_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_03"); //No, todavía no sabemos suficiente.
	};	
};

///////////////////////////////////////////////////////////////////////
//	Info Sylvio
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_SYLVIO		(C_INFO)
{
	npc		 = 	SLD_800_Lee;
	nr		 = 	3;
	condition	 = 	DIA_Lee_SYLVIO_Condition;
	information	 = 	DIA_Lee_SYLVIO_Info;

	description	 = 	"¿Qué ha ocurrido mientras tanto?";
};

func int DIA_Lee_SYLVIO_Condition ()
{
	if (MIS_ReadyforChapter4 == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Lee_SYLVIO_Info ()
{
	AI_Output			(other, self, "DIA_Lee_SYLVIO_15_00"); //¿Qué ha ocurrido mientras tanto?
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_01"); //Sylvio, el bastardo, ha oído hablar de los dragones del Valle de las Minas y tiene a todos los de las granja de los nervios.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_02"); //Intenta convencer a los chicos de que le sigan al Valle de las Minas. Les ha prometido fama, honor, oro y todo tipo de cosas.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_03"); //Muchos de ellos no tienen el menor interés en morir por Sylvio, pero hay unos cuantos imbéciles que se creen sus idioteces.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_04"); //El final de la historia es que Bennet les equipó y se marcharon.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_05"); //(Sin darle importancia) Bueno, en realidad, estoy contento de que Sylvio haya ido de una vez de la granja.
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

INSTANCE DIA_Lee_KAP4_EXIT(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 999;
	condition	= DIA_Lee_KAP4_EXIT_Condition;
	information	= DIA_Lee_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lee_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Can You Teach Me?
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_CanTeach		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	10;
	condition	 = 	DIA_Lee_CanTeach_Condition;
	information	 = 	DIA_Lee_CanTeach_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"¿Podrías entrenarme?";
};
func int DIA_Lee_CanTeach_Condition ()
{	
	if Kapitel >= 4
	&& Lee_TeachPlayer == FALSE
	{
		return TRUE;
	};
};
func void DIA_Lee_CanTeach_Info ()
{
	AI_Output			(other, self, "DIA_Lee_CanTeach_15_00"); //¿Puedes entrenarme?
	
	AI_Output			(self, other, "DIA_Lee_CanTeach_04_01"); //Te puedo enseñar a luchar con un mandoble.
	
	if (other.HitChance[NPC_TALENT_2H] < 75)
	{
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_02"); //Pero no tengo tiempo para enseñarte los fundamentos.
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_03"); //Cuando hayas llegado a cierto nivel de habilidad, te echaré una mano. Hasta entonces, tendrás que encontrar otro maestro.
	}
	else
	{
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_04"); //He oído que eres bastante bueno, pero apuesto a que te puedo enseñar una cosa a o dos.
		if (other.guild == GIL_SLD)
		|| (other.guild == GIL_DJG)
		{
			Lee_TeachPlayer = TRUE;
			Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
			B_LogEntry (Topic_SoldierTeacher,"Lee me enseñará a usar armas a dos manos.");
		}
		else
		{
			AI_Output			(self, other, "DIA_Lee_CanTeach_04_05"); //Así que, si quieres, te puedo enseñar algo. Aunque eso sí, te saldrá un poco caro.
			AI_Output			(other,self , "DIA_Lee_CanTeach_15_06"); //¿Cuánto?
			AI_Output			(self, other, "DIA_Lee_CanTeach_04_07"); //1000 monedas de oro y hay trato.
		
			Info_ClearChoices (DIA_Lee_CanTeach);
			Info_AddChoice (DIA_Lee_CanTeach,"Es demasiado caro.",DIA_Lee_CanTeach_No);
		
			if (Npc_HasItems (other,ItMi_Gold) >= 1000)
			{
				Info_AddChoice (DIA_Lee_CanTeach,"De acuerdo. Aquí está el dinero.",DIA_Lee_CanTeach_Yes);
			};
		};
	};		
};
 
FUNC VOID DIA_Lee_CanTeach_No ()
{
	AI_Output (other,self ,"DIA_Lee_CanTeach_No_15_00"); //Es demasiado caro.
	AI_Output (self ,other,"DIA_Lee_CanTeach_No_04_01"); //Piénsalo. No es fácil encontrar maestros de mi calibre.
	
	Info_ClearChoices (DIA_Lee_CanTeach);
}; 

FUNC VOID DIA_Lee_CanTeach_Yes ()
{
	AI_Output (other,self ,"DIA_Lee_CanTeach_Yes_15_00"); //De acuerdo. Aquí está el dinero.
	AI_Output (self ,other,"DIA_Lee_CanTeach_Yes_04_01"); //Perfecto, te lo garantizo: valgo lo que pagas.
	
	B_GiveInvItems (other,self,ItMi_Gold,1000);
	Lee_TeachPlayer = TRUE;
	Info_ClearChoices (DIA_Lee_CanTeach);
	Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry (Topic_SoldierTeacher,"Lee me enseñará a usar armas a dos manos.");
};
 
//**************************************
//			Ich will trainieren
//**************************************
INSTANCE DIA_Lee_Teach(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 10;
	condition	= DIA_Lee_Teach_Condition;
	information	= DIA_Lee_Teach_Info;
	permanent	= TRUE;
	description = "Empecemos con el entrenamiento.";
};                       

FUNC INT DIA_Lee_Teach_Condition()
{
	IF (Lee_Teachplayer == TRUE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Lee_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Lee_Teach_15_00"); //Empecemos con el entrenamiento.
	
	Info_ClearChoices 	(DIA_Lee_Teach);
	Info_AddChoice 		(DIA_Lee_Teach,	DIALOG_BACK		,DIA_Lee_Teach_Back);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_Teach_2H_5);

};

FUNC VOID DIA_Lee_Teach_Back ()
{
	Info_ClearChoices (DIA_Lee_Teach);
};


FUNC VOID DIA_Lee_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100);
	
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_00"); //Ahora eres un auténtico maestro en el combate con armas a dos manos.
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_01"); //Ya no necesitas maestro.
	};
	Info_ClearChoices 	(DIA_Lee_Teach);
	Info_AddChoice 		(DIA_Lee_Teach,	DIALOG_BACK		,DIA_Lee_Teach_Back);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_Teach_2H_5);
};

FUNC VOID DIA_Lee_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100);
	
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_00"); //Ahora eres un auténtico maestro en el combate con armas a dos manos.
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_01"); //Ya no necesitas maestro.
	};
	Info_ClearChoices 	(DIA_Lee_Teach);
	Info_AddChoice 		(DIA_Lee_Teach,	DIALOG_BACK		,DIA_Lee_Teach_Back);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_Teach_2H_5);
};

///////////////////////////////////////////////////////////////////////
//	Info Drachenei
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_DRACHENEI		(C_INFO)
{
	npc		 = 	SLD_800_Lee;
	nr		 = 	4;
	condition	 = 	DIA_Lee_DRACHENEI_Condition;
	information	 = 	DIA_Lee_DRACHENEI_Info;

	description	 = 	"Los hombres lagarto están distribuyendo huevos de dragón por toda la zona.";
};

func int DIA_Lee_DRACHENEI_Condition ()
{

	if (Npc_HasItems (other,ItAt_DragonEgg_MIS))
	{
		return TRUE;
	};
};

func void DIA_Lee_DRACHENEI_Info ()
{
	AI_Output			(other, self, "DIA_Lee_DRACHENEI_15_00"); //Los hombres lagarto están distribuyendo huevos de dragón por toda la zona.
	B_GivePlayerXP (XP_Ambient);
	AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_01"); //Debería haberlo sabido. Es hora de que nos vayamos de aquí.
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output			(other, self, "DIA_Lee_DRACHENEI_15_02"); //¿Y qué voy a hacer con ellos?
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_03"); //Aplastarlos. ¿Qué si no?
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_04"); //Puede que las cáscaras sirvan para hacer armaduras o algo así.
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_05"); //Parecen muy firmes. Habla con Bennet de ello.
		B_LogEntry (TOPIC_DRACHENEIER,"Lee no podía hacer gran cosa con el huevo de dragón. Me ha enviado a Bennet, el herrero."); 
	};
};

//********************************************************************
//	Kap 4 Perm
//********************************************************************

INSTANCE DIA_Lee_KAP4_Perm(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 49;
	condition	= DIA_Lee_KAP4_Perm_Condition;
	information	= DIA_Lee_KAP4_Perm_Info;
	permanent	= TRUE;
	description = "¿Qué tal van las cosas en la granja?";
};                       
FUNC INT DIA_Lee_KAP4_Perm_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KAP4_Perm_Info()
{	
	AI_Output (other,self ,"DIA_Lee_KAP4_Perm_15_00"); //¿Qué tal van las cosas en la granja?
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_01"); //Bueno, desde que Sylvio se fue, hemos conseguido algo de paz.
	AI_Output (other,self ,"DIA_Lee_KAP4_Perm_15_02"); //No suena mal.
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_03"); //Por desgracia, no tenemos menos trabajo. Los hombres están cada vez más descontentos porque ahora tienen que hacer ellos el trabajo de los hombres de Sylvio.
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_04"); //Pero no me importa preocuparme de eso. Puedo hacerme cargo.
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

INSTANCE DIA_Lee_KAP5_EXIT(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 999;
	condition	= DIA_Lee_KAP5_EXIT_Condition;
	information	= DIA_Lee_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lee_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_GetShip		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_GetShip_Condition;
	information	 = 	DIA_Lee_GetShip_Info;
	
	description	 = 	"¿Tienes alguna idea de cómo tomar la nave de los paladines?";
};
func int DIA_Lee_GetShip_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{	
		return TRUE;
	};
};
func void DIA_Lee_GetShip_Info ()
{
	AI_Output	(other, self, "DIA_Lee_GetShip_15_00"); //¿Tienes alguna idea de cómo tomar la nave de los paladines?
	AI_Output	(self, other, "DIA_Lee_GetShip_04_01"); //¿Crees que si la tuviera aún estaría aquí? Esa cosa está mejor vigilada que los transportes de mineral del antiguo campamento.
	AI_Output	(other, self, "DIA_Lee_GetShip_15_02"); //Tiene que haber una forma de hacerse con el barco.
	AI_Output	(self, other, "DIA_Lee_GetShip_04_03"); //Claro. Subir es sencillo.
	
	Log_CreateTopic (TOPIC_Ship, LOG_MISSION);   	                                                                                                                                                                                                                                             
	Log_SetTopicStatus(TOPIC_Ship, LOG_RUNNING);                                                                                                                                                                                                                                                 
			
		if (MIS_Lee_JudgeRichter == LOG_SUCCESS)
		&& ((Npc_IsDead(Richter))== FALSE)
		{
			AI_Output	(self, other, "DIA_Lee_GetShip_04_04"); //Después de todo, tenemos al juez en nuestras manos. Ve a verle y sácale una autorización para acceder al barco.
			MIS_RichtersPermissionForShip = LOG_RUNNING;
			B_LogEntry (TOPIC_Ship,"Lee opina que la mejor manera de subir a la nave de los paladines es conseguir una autorización del juez. Pero no parece que esté muy dispuesto a darla.");
		}
		else if ((hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
		{
			AI_Output	(self, other, "DIA_Lee_GetShip_04_05"); //Aquí tengo una carta de autorización falsificada. Con esto, los guardias te dejarán pasar.
		
			B_LogEntry (TOPIC_Ship,"El bueno de Lee. Ha escrito una carta falsificada por la que se me permite subir a la nave de los paladines.");
		};

	AI_Output	(self, other, "DIA_Lee_GetShip_04_06"); //Pero eso no es todo. Para gobernar el barco necesitas un capitán, una tripulación y todo eso.
	AI_Output	(self, other, "DIA_Lee_GetShip_04_07"); //Hay que tener en cuenta muchas cosas.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	                  
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);  
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);
	                  
	Info_ClearChoices	(DIA_Lee_GetShip);
	Info_AddChoice	(DIA_Lee_GetShip, DIALOG_BACK, DIA_Lee_GetShip_back );
	Info_AddChoice	(DIA_Lee_GetShip, "¿A quién debería contratar como tripulación?", DIA_Lee_GetShip_crew );
	
	if ((Npc_IsDead(Torlof))== FALSE)
	{
		Info_AddChoice	(DIA_Lee_GetShip, "¿Conoces a alguien que pueda gobernar un barco?", DIA_Lee_GetShip_torlof );
	};

};
func void DIA_Lee_GetShip_torlof ()
{
	AI_Output			(other, self, "DIA_Lee_GetShip_torlof_15_00"); //¿Conoces a alguien que pueda gobernar un barco?
	AI_Output			(self, other, "DIA_Lee_GetShip_torlof_04_01"); //Tengo entendido que Torlof solía navegar y que está versado en el tema.

	B_LogEntry (TOPIC_Captain,"Torlof es un viejo lobo de mar y es posible que quiera ser mi capitán.");
};

func void DIA_Lee_GetShip_crew ()
{
	AI_Output			(other, self, "DIA_Lee_GetShip_crew_15_00"); //¿A quién debería contratar como tripulación?
	AI_Output			(self, other, "DIA_Lee_GetShip_crew_04_01"); //Tendrás que decidirlo por ti mismo. Pero yo solo llevaría a gente de confianza. ¿Tienes suficiente gente en la que confíes?
	AI_Output			(self, other, "DIA_Lee_GetShip_crew_04_02"); //Si necesitas un herrero en la tripulación, deberías pedírselo a Bennet. Sin duda es el mejor que encontrarás.

	B_LogEntry (TOPIC_Crew,"Lee no podía ayudarme con la tripulación. Pero sí me dijo que solo llevara gente de confianza. Tengo que preguntarle a Bennet si le interesa.");
};

func void DIA_Lee_GetShip_back ()
{
	Info_ClearChoices	(DIA_Lee_GetShip);
};

///////////////////////////////////////////////////////////////////////
//	GotRichtersPermissionForShip
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_GotRichtersPermissionForShip		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_GotRichtersPermissionForShip_Condition;
	information	 = 	DIA_Lee_GotRichtersPermissionForShip_Info;

	description	 = 	"La autorización escrita funcionó perfectamente.";
};
func int DIA_Lee_GotRichtersPermissionForShip_Condition ()
{	
	if (MIS_RichtersPermissionForShip == LOG_SUCCESS)	
	{
		return TRUE;
	};
};
func void DIA_Lee_GotRichtersPermissionForShip_Info ()
{
	AI_Output			(other, self, "DIA_Lee_GotRichtersPermissionForShip_15_00"); //La autorización escrita funcionó perfectamente. El barco ya es mío. El juez cooperó encantado.
	AI_Output			(self, other, "DIA_Lee_GotRichtersPermissionForShip_04_01"); //Bien. El tiempo en que te humillabas ante el bastardo ha merecido la pena.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Ich will das Schiff klauen
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_StealShip		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_StealShip_Condition;
	information	 = 	DIA_Lee_StealShip_Info;
	PERMANENT 	 =  FALSE;
	description	 = 	"Quiero robar el barco.";
};

func int DIA_Lee_StealShip_Condition ()
{	
	if (Npc_KnowsInfo (other,DIA_Lee_GetShip))
	&& (hero.guild == GIL_DJG)
	&& (MIS_RichtersPermissionForShip == 0)	//Joly: kein Richter Erpressen nötig!
	{
		return TRUE;
	};	
};

func void DIA_Lee_StealShip_Info ()
{
	AI_Output	(other, self, "DIA_Lee_StealShip_15_00"); //Quiero robar el barco.
	AI_Output	(self, other, "DIA_Lee_StealShip_04_01"); //¿Y cómo lo vas a hacer?
	AI_Output	(other, self, "DIA_Lee_StealShip_15_02"); //Está chupado. Vamos allí, les enseñamos tus papeles y nos llevamos el barco.
	AI_Output	(self, other, "DIA_Lee_StealShip_04_03"); //Lo que tú digas. Toma, espero que sepas lo que estás haciendo.
	
	CreateInvItems (self,ItWr_ForgedShipLetter_Mis,1);
	B_GiveInvItems (self,other,ItWr_ForgedShipLetter_Mis,1);
};

//Lee anheuern

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_KnowWhereEnemy_Condition;
	information	 = 	DIA_Lee_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"¿Me acompañarás a la nave?";
};
func int DIA_Lee_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Lee_IsOnBoard == FALSE)
	&& (Npc_KnowsInfo (other, DIA_Lee_GetShip))
	{
		return TRUE;
	};
};
func void DIA_Lee_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_Lee_KnowWhereEnemy_15_00"); //¿Me acompañarás a la nave?
	AI_Output			(self, other, "DIA_Lee_KnowWhereEnemy_04_01"); //¿Estás de broma? Claro que me apunto. Tengo unas cuantas deudas que saldar en el continente.
	AI_Output			(self, other, "DIA_Lee_KnowWhereEnemy_04_02"); //Además, te puedo enseñar el arte del combate con armas a dos manos. Podría serte muy útil.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                 
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                 
	B_LogEntry (TOPIC_Crew,"Lee está deseando volver a ver el continente. Se ha ofrecido a ayudarme. Me sería complicado encontrar un instructor de combate tan bueno como él.");
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lee_KnowWhereEnemy_15_03"); //Ahora el barco está lleno, pero volveré si hay un hueco.
	}
	else 
	{
		Info_ClearChoices (DIA_Lee_KnowWhereEnemy);
		Info_AddChoice (DIA_Lee_KnowWhereEnemy,"Te avisaré si me puedes resultar útil.",DIA_Lee_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lee_KnowWhereEnemy,"¡Entonces ve a preparar tus cosas!",DIA_Lee_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lee_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_Yes_15_00"); //¡Entonces ve a preparar tus cosas!
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_Yes_04_01"); //¿Qué? ¿Ahora mismo?
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_Yes_15_02"); //Sí, planeo salir de aquí y si quieres unirte a mí, ven al puerto. Nos encontraremos en la nave.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_Yes_04_03"); //He esperado este momento durante mucho tiempo. Allí estaré.
	
	B_GivePlayerXP (XP_Crewmember_Success);                                                                    
	                                                                                                           
	
	Lee_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};
		
	Info_ClearChoices (DIA_Lee_KnowWhereEnemy);
};

FUNC VOID DIA_Lee_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_No_15_00"); //Te avisaré si me puedes resultar útil.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_No_04_01"); //Debes saber lo que quieres, pero los buenos guerreros nunca sobran.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_No_04_02"); //(Sonríe torvamente) A menos que sean imbéciles como Sylvio.

	Lee_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Lee_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_LeaveMyShip		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_LeaveMyShip_Condition;
	information	 = 	DIA_Lee_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"¡Al final no te necesito!";
};

func int DIA_Lee_LeaveMyShip_Condition ()
{	
	if (Lee_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lee_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_Lee_LeaveMyShip_15_00"); //¡Al final no te necesito!
	AI_Output			(self, other, "DIA_Lee_LeaveMyShip_04_01"); //Como quieras, ¡ya sabes dónde encontrarme!
	
	Lee_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"ShipOff"); 
};


///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_StillNeedYou		(C_INFO)
{
	npc			 = 	SLD_800_Lee;
	nr			 = 	4;
	condition	 = 	DIA_Lee_StillNeedYou_Condition;
	information	 = 	DIA_Lee_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"¡Al final sí que me puedes ser útil!";
};
func int DIA_Lee_StillNeedYou_Condition ()
{	
	if ((Lee_IsOnBOard == LOG_OBSOLETE)		//Hier braucht man natürlich nur eine variable abfragen
	|| (Lee_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};
func void DIA_Lee_StillNeedYou_Info ()
{
	AI_Output			(other, self, "DIA_Lee_StillNeedYou_15_00"); //¡Al final sí que me puedes ser útil!
	
	if (Lee_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_01"); //¡Sabía que te haría falta! Te veré en tu barco.
		
		Lee_IsOnBoard	 = LOG_SUCCESS;
		crewmember_Count = (Crewmember_Count +1);
	
	if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine (self,"SHIP"); 
		}
		else
		{
			Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
		};
	}
	else
	{
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_02"); //¿Sabes qué?, que te jodan. Primero me dices que vaya, y después me rechazas.
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_03"); //¡Búscate a otro idiota!
	
		AI_StopProcessInfos (self);
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


INSTANCE DIA_Lee_KAP6_EXIT(C_INFO)
{
	npc			= SLD_800_Lee;
	nr			= 999;
	condition	= DIA_Lee_KAP6_EXIT_Condition;
	information	= DIA_Lee_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lee_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lee_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};



































