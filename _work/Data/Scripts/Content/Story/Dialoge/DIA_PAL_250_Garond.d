// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_garond_EXIT(C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 999;
	condition	= DIA_Garond_EXIT_Condition;
	information	= DIA_Garond_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Garond_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Garond_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 					Petzmaster: Schulden offen 
// ************************************************************

// ---------------------------
var int Garond_LastPetzCounter;
var int Garond_LastPetzCrime;
// ---------------------------

INSTANCE DIA_Garond_PMSchulden (C_INFO)
{
	npc         = PAL_250_Garond;
	nr          = 1;
	condition   = DIA_Garond_PMSchulden_Condition;
	information = DIA_Garond_PMSchulden_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Garond_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Garond_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Garond_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Garond_PMSchulden_Info()
{
	AI_Output (self, other, "DIA_Garond_PMSchulden_10_00"); //No vamos a discutir nada hasta que no pagues la multa.

	if (B_GetTotalPetzCounter(self) > Garond_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_01"); //Y ésta es superior, teniendo en cuenta las acusaciones más recientes.
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_02"); //Parece que te has metido en más problemas aún.
		
		if (Garond_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_03"); //¡No obstante, espero que ahora pagues todo! En total, la suma asciende a...
		}
		else
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_04"); //Me has decepcionado mucho. La suma de tus multas es...
		};
				
		var int diff; diff = (B_GetTotalPetzCounter(self) - Garond_LastPetzCounter);
		
		if (diff > 0)
		{
			Garond_Schulden = Garond_Schulden + (diff * 50);
		};
		
		if (Garond_Schulden > 1000)	{	Garond_Schulden = 1000;	};
		
		B_Say_Gold (self, other, Garond_Schulden);
	}
	else if (B_GetGreatestPetzCrime(self) < Garond_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_05"); //Han surgido unas cuantas cosas más.
		
		if (Garond_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_06"); //Ha sido de repente, pero ya no estás acusado de asesinato.
		};
		
		if (Garond_LastPetzCrime == CRIME_THEFT)
		|| ( (Garond_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_07"); //Nadie recuerda haberte visto cometer un robo.
		};
		
		if (Garond_LastPetzCrime == CRIME_ATTACK)
		|| ( (Garond_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_08"); //Ya no hay testigos que certifiquen que te has visto envuelto en peleas.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_09"); //Parece que se han retirado los cargos contra ti.
		};
		
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_10"); //No tengo ni idea de lo que pasó pero, te lo advierto: ¡no te pases!
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_11"); //He decidido condonar tus deudas.
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_12"); //¡Y no vuelvas a meterte en líos en el castillo!
	
			Garond_Schulden			= 0;
			Garond_LastPetzCounter 	= 0;
			Garond_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_13"); //Quiero que quede clara una cosa: de todas maneras vas a pagar todas las multas.
			B_Say_Gold (self, other, Garond_Schulden);
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_14"); //Bueno, ¿y qué pasa?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Garond_PMSchulden);
		Info_ClearChoices  	(DIA_Garond_PETZMASTER);
		Info_AddChoice		(DIA_Garond_PMSchulden,"¡No tengo bastante oro!",DIA_Garond_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Garond_PMSchulden,"¿Dime otra vez cuánto era?",DIA_Garond_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
		{
			Info_AddChoice 	(DIA_Garond_PMSchulden,"¡Quiero pagar la multa!",DIA_Garond_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Garond_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Garond_PMSchulden_HowMuchAgain_15_00"); //¿Y cuánto era?
	B_Say_Gold (self, other, Garond_Schulden);

	Info_ClearChoices  	(DIA_Garond_PMSchulden);
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_AddChoice		(DIA_Garond_PMSchulden,"¡No tengo bastante oro!",DIA_Garond_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Garond_PMSchulden,"¿Dime otra vez cuánto era?",DIA_Garond_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
	{
		Info_AddChoice 	(DIA_Garond_PMSchulden,"¡Quiero pagar la multa!",DIA_Garond_PETZMASTER_PayNow);
	};
};

// *** weitere Choices siehe unten (DIA_Garond_PETZMASTER) ***


// ************************************************************
// 			  			 PETZ-MASTER 
// ************************************************************

instance DIA_Garond_PETZMASTER   (C_INFO)
{
	npc         = PAL_250_Garond;
	nr          = 1;
	condition   = DIA_Garond_PETZMASTER_Condition;
	information = DIA_Garond_PETZMASTER_Info;
	permanent   = TRUE;
	important	= TRUE;
};
FUNC INT DIA_Garond_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Garond_LastPetzCrime)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_PETZMASTER_Info()
{
	Garond_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	// ------ SC hat mit Garond noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_00"); //Así que tú eres el que ha causado problemas en el castillo.
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_01"); //He estado preguntándome cuánto tardarías en venir a verme.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_02"); //Lo último que necesito aquí es un asesino.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_03"); //Necesito a cada uno de mis hombres, ¡y ahora me vuelve a faltar uno!
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Garond_Schulden = Garond_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_04"); //Por no hablar de los problemas en los que te metes.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_05"); //Déjame que te explique algo. Aquí estamos todos atrapados.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_06"); //Y necesito desesperadamente a cada uno de mis hombres. Incluyéndote a ti.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_07"); //Si te apetece matar a alguien, no tienes más que salir del castillo. Ahí fuera hay orcos de sobra.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_08"); //Te voy a imponer una multa, aunque siento tener que encargarme de estas estupideces.
	};		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_09"); //Dicen que has estado robando.
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_10"); //Por no hablar del resto de las cosas que me han dicho.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_11"); //No te vas a ir de rositas. Parece que no entiendes la gravedad de la situación.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_12"); //¡Se te hará pagar una multa que compense tus delitos!
		
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_13"); //No me gusta ver cómo se pelean mis hombres.
	
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_14"); //Y lo de la oveja tampoco era necesario.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_15"); //¡Así que tendrás que pagar una multa por ello!
		
		
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};

	// ------ Schaf getötet (es gibt drei Schafe in der Burg) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_16"); //¿Vas por ahí matando a nuestras ovejas? Son de todos.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_17"); //Me pagarás por la carne.
	
		
		Garond_Schulden = 100;
	
	};
	
	AI_Output (other, self, "DIA_Garond_PETZMASTER_15_18"); //¿Cuánto?
	
	if (Garond_Schulden > 1000)	{	Garond_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Garond_Schulden);
	
	Info_ClearChoices  	(DIA_Garond_PMSchulden);
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_AddChoice		(DIA_Garond_PETZMASTER,"¡No tengo bastante oro!",DIA_Garond_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
	{
		Info_AddChoice 	(DIA_Garond_PETZMASTER,"¡Quiero pagar la multa!",DIA_Garond_PETZMASTER_PayNow);
	};
};

func void DIA_Garond_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Garond_PETZMASTER_PayNow_15_00"); //¡Quiero pagar la multa!
	B_GiveInvItems (other, self, itmi_gold, Garond_Schulden);
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayNow_10_01"); //De acuerdo, entonces les diré a los chicos que se calmen. ¡Pero que no te vuelva a coger con algo así!

	B_GrantAbsolution (LOC_OLDCAMP);
	
	Garond_Schulden			= 0;
	Garond_LastPetzCounter 	= 0;
	Garond_LastPetzCrime	= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_ClearChoices  	(DIA_Garond_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Garond_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Garond_PETZMASTER_PayLater_15_00"); //¡No tengo oro suficiente!
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayLater_10_01"); //Entonces tendrás que conseguir el oro lo antes que puedas.
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayLater_10_02"); //Y, te lo advierto: si causas más problemas, ¡el precio subirá!
	
	Garond_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Garond_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  			Hallo
// ************************************************************
INSTANCE DIA_Garond_Hello (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Hello_Condition;
	information	= DIA_Garond_Hello_Info;
	IMPORTANT 	= TRUE;
	permanent	= FALSE;
};                       

FUNC INT DIA_Garond_Hello_Condition()
{
	if (Kapitel == 2)
	&& Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Garond_Hello_Info()
{	
		AI_Output (self ,other,"DIA_Garond_Hello_10_00"); //¿De dónde vienes? No eres uno de los raspadores y no eres uno de los míos. ¿Y bien?
		AI_Output (other ,self,"DIA_Garond_Hello_15_01"); //Vengo del otro lado del paso.
		AI_Output (self ,other,"DIA_Garond_Hello_10_02"); //¿Por el paso...? Has cruzado, ¡por Innos!
		
		if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_03"); //¿Por qué has elegido este camino, mago?
		}
		else if (hero.guild == GIL_MIL)
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_04"); //Soldado, ¿cuáles son tus órdenes?
		}
		else
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_05"); //Me pregunto por qué un mercenario querría meterse en todo esto. ¿Qué haces aquí?
		};
};

//**********************************
//	Ich brauch Beweise 
//**********************************

INSTANCE DIA_Garond_NeedProof (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 1;
	condition	= DIA_Garond_NeedProof_Condition;
	information	= DIA_Garond_NeedProof_Info;
	description = "Vengo de parte de lord Hagen.";
};                       

FUNC INT DIA_Garond_NeedProof_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Garond_Hello))
	&& (MIS_OLDWORLD == LOG_RUNNING)
	&&	(Kapitel == 2)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Garond_NeedProof_Info()
{		
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_00"); //Vengo por encargo de lord Hagen. Quiere que le lleve pruebas de la presencia de dragones.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_01"); //¿Y has venido para recogerlas y volver a desaparecer?
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_02"); //Ésa es mi intención.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_03"); //¿Así que quiere pruebas? Las tendrá. Pero no te puedo enviar de vuelta con lord Hagen sin darle información acerca del mineral.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_04"); //Escucha, lord Hagen tiene que comprender, sin lugar a dudas, cuál es la situación aquí y cuánto mineral hemos conseguido hasta ahora.
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_05"); //De acuerdo, ¿qué quieres que haga por ti?
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_06"); //He enviado tres grupos de raspadores, pero no me han mandado ni una triste pepita.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_07"); //Visita las minas y dime cuánto mineral han extraído.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_08"); //Luego te escribiré una carta que llevarás a lord Hagen.
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_09"); //Bueno, supongo que no tengo elección.
	
	MIS_ScoutMine = LOG_RUNNING;
	B_StartOtherRoutine (Jergan,"FAJETH");
	
	B_LogEntry (TOPIC_MISOLDWORLD,"Antes de que el comandante Garond me mande de vuelta, quiere que busque las tres unidades de raspadores y le diga cuánto mineral han acumulado.");
	
	Log_CreateTopic (TOPIC_ScoutMine,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_ScoutMine,LOG_RUNNING);
	
	B_LogEntry (TOPIC_ScoutMine,"El comandante Garond me ha encargado una misión. Ha enviado tres unidades de raspadores a por mineral mágico. Por ahora no han vuelto.");
	B_LogEntry (TOPIC_ScoutMine,"Tengo que encontrar a las tres unidades de raspadores y descubrir cuánto mineral han acumulado.");

};
// ************************************************************
// 			  Warum ich?
// ************************************************************

INSTANCE DIA_Garond_Why (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Why_Condition;
	information	= DIA_Garond_Why_Info;
	permanent	= FALSE;
	description = "Pero, ¿por qué, de entre todos, yo?";
};                       

FUNC INT DIA_Garond_Why_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Why_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Why_15_00"); //Pero, ¿por qué me eliges a mí?
	AI_Output (self ,other,"DIA_Garond_Why_10_01"); //Porque sabes atravesar las líneas orcas. Mis chicos no tendrían ninguna oportunidad.
	AI_Output (self ,other,"DIA_Garond_Why_10_02"); //Por otra parte, te las has arreglado para pasar una vez, eso te hace el mejor para este trabajo.
};
// ************************************************************
// 			Ausrüstung
// ************************************************************

INSTANCE DIA_Garond_Equipment (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Equipment_Condition;
	information	= DIA_Garond_Equipment_Info;
	permanent	= FALSE;
	description = "Necesito equipo.";
};                       

FUNC INT DIA_Garond_Equipment_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& ((other.guild == GIL_KDF)
	||  (other.guild == GIL_MIL))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Equipment_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Equipment_15_00"); //Necesito equipo.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Garond_Equipment_10_01"); //Habla con Milten, el mago, que está en el castillo. Podrá ayudarte con las cosas que necesitas.
	};
	if (other.guild == GIL_MIL)
	{
		AI_Output (self ,other,"DIA_Garond_Equipment_10_02"); //Habla de eso con Tandor. Él te conseguirá todo lo que necesites.
		
		Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
		B_LogEntry (TOPIC_Trader_OC,"Tandor vende armas en el castillo.");
	};
};
// ************************************************************
// 			Zahlen
// ************************************************************

INSTANCE DIA_Garond_zahlen (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_zahlen_Condition;
	information	= DIA_Garond_zahlen_Info;
	permanent	= FALSE;
	description = "¿Cuánto me pagarás por este trabajo?";
};                       

FUNC INT DIA_Garond_zahlen_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_zahlen_Info()
{		
	AI_Output (other,self ,"DIA_Garond_zahlen_15_00"); //¿Cuánto me pagarás por este trabajo?
	AI_Output (self ,other,"DIA_Garond_zahlen_10_01"); //(Irritado) No suelo regatear con mercenarios.
	AI_Output (self ,other,"DIA_Garond_zahlen_10_02"); //Bien, supongo que no tengo elección. Te pagaré 500 monedas de oro si te encargas de la misión.
};
// ************************************************************
// 	Wo finde ich die Schürfstellen?
// ************************************************************

INSTANCE DIA_Garond_Wo (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Wo_Condition;
	information	= DIA_Garond_Wo_Info;
	permanent	= FALSE;
	description = "¿Dónde están las minas?";
};                       

FUNC INT DIA_Garond_Wo_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Wo_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Wo_15_00"); //¿Dónde están las minas?
	AI_Output (self ,other,"DIA_Garond_Wo_10_01"); //Toma este mapa. Muestra dos zonas en las que están las minas.
	
	CreateInvItems (self, ItWr_Map_OldWorld_Oremines_MIS, 1);									
	B_GiveInvItems (self, other, ItWr_Map_OldWorld_Oremines_MIS, 1);					

	AI_Output (self ,other,"DIA_Garond_Wo_10_02"); //Si tienes más preguntas, pregunta a Parcival. Te podrá decir todo lo que necesites acerca de los raspadores.
	
	B_LogEntry (TOPIC_ScoutMine,"Parcival, el paladín, puede informarme acerca de los raspadores.");
};

FUNC VOID B_Garond_OreCounter3 ()
{		
	AI_Output (self ,other,"B_Garond_OreCounter3_10_00"); //¡Maldición! ¿Qué está pasando ahí fuera? ¿Es que ha venido el mismo Beliar a acabar con nosotros?
	AI_Output (self ,other,"B_Garond_OreCounter3_10_01"); //Mis hombres están casi todos muertos y con el poco mineral que tenemos, ¡NO PODEMOS PARAR A UN ORCO Y MUCHO MENOS A UN EJÉRCITO!
	AI_Output (self ,other,"B_Garond_OreCounter3_10_02"); //Esta expedición está condenada.
};

// ************************************************************
// 	Fajeth
// ************************************************************
INSTANCE DIA_Garond_Fajeth (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 2;
	condition	= DIA_Garond_Fajeth_Condition;
	information	= DIA_Garond_Fajeth_Info;
	permanent	= FALSE;
	description = "He hablado con Fajeth.";
};                       

FUNC INT DIA_Garond_Fajeth_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Fajeth_Ore == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Fajeth_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Fajeth_15_00"); //He hablado con Fajeth.
	AI_Output (self ,other,"DIA_Garond_Fajeth_10_01"); //¿Qué tiene que decirme?
	AI_Output (other,self ,"DIA_Garond_Fajeth_15_02"); //Su gente ha extraído dos cofres de mineral.
	AI_Output (self ,other,"DIA_Garond_Fajeth_10_03"); //Mmm... ¿dos cofres? No necesito dos cofres, necesito, DOSCIENTOS.
 	AI_Output (other,self ,"DIA_Garond_Fajeth_15_04"); //Quiere que te diga que necesita más hombres.
 	AI_Output (self ,other,"DIA_Garond_Fajeth_10_05"); //¿Qué? ¿Tengo que enviar aún más a una muerte segura? Puede ir olvidándose.
 	
 	Ore_Counter = (Ore_Counter +1);
 	B_GivePlayerXP (XP_Fajeth_Ore);
 	
 	if (Ore_Counter >= 3)
	{
		B_Garond_OreCounter3 ();
	};
};

// ************************************************************
// 	Silvestro
// ************************************************************
INSTANCE DIA_Garond_Silvestro (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 2;
	condition	= DIA_Garond_Silvestro_Condition;
	information	= DIA_Garond_Silvestro_Info;
	permanent	= FALSE;
	description = "Acerca de la mina de Silvestro...";
};                       

FUNC INT DIA_Garond_Silvestro_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Silvestro_Ore == TRUE)
	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Silvestro_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_00"); //Con respecto a la mina de Silvestro...
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_01"); //¿Has ido a verle? ¿Has hablado con él?
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_02"); //Allí están todos muertos. Fueron sorprendidos por reptadores de la mina.
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_03"); //¿Y qué hay del mineral? ¿Sabes cuánto habían minado?
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_04"); //Consiguieron poner a salvo unos cuantos cofres. Están en una cueva, en el camino que va del castillo a la mina.
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_05"); //¡Maldición! Eran buenos hombres, que Innos se apiade de sus almas.
	
	Ore_Counter = (Ore_Counter +1);
	B_GivePlayerXP (XP_Silvestro_Ore);
	
	if (Ore_Counter >= 3)
	{
		B_Garond_OreCounter3 ();
	};
};
// ************************************************************
// 	Marcos
// ************************************************************
INSTANCE DIA_Garond_Marcos (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 2;
	condition	= DIA_Garond_Marcos_Condition;
	information	= DIA_Garond_Marcos_Info;
	permanent	= FALSE;
	description = "He visto a Marcos.";
};                       

FUNC INT DIA_Garond_Marcos_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Marcos_Ore == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Marcos_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Marcos_15_00"); //He visto a Marcos.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_01"); //¿Y? ¿Qué se cuénta? ¿Cuánto mineral ha extraído?
	AI_Output (other,self ,"DIA_Garond_Marcos_15_02"); //Cuatro cofres. Se ha ido de la mina para poner a salvo el mineral.
	AI_Output (other,self ,"DIA_Garond_Marcos_15_03"); //Ahora esta custodiando los cofres en un pequeño valle detrás de las líneas de los orcos, pero pide refuerzos.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_04"); //¿Qué? Solo cuatro cofres ¿y se va de la mina? Maldición, no son buenas noticias.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_05"); //¿Y ahora quiere más hombres...? Bueno, estupendo, le mandaré dos.
	
	
	Marcos_Guard1.flags = 0;
	Marcos_Guard2.flags = 0;
	
	B_StartOtherRoutine (Marcos_Guard1,"MARCOS");
	B_StartOtherRoutine (Marcos_Guard2,"MARCOS");
	
	AI_Teleport (Marcos_Guard1,"OW_STAND_GUARDS");
	AI_Teleport (Marcos_Guard1,"OW_STAND_GUARDS");
	
	Ore_Counter = (Ore_Counter +1);
	MIS_Marcos_Jungs = LOG_SUCCESS;

	B_GivePlayerXP (XP_Marcos_Ore);
	
	if (Ore_Counter >= 3)
	{
		B_Garond_OreCounter3 ();
	};
};		
// ************************************************************
// Info Success
// ************************************************************

INSTANCE DIA_Garond_Success (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Success_Condition;
	information	= DIA_Garond_Success_Info;
	permanent	= FALSE;
	description = "¿Qué hay de la carta para lord Hagen?";
};                       

FUNC INT DIA_Garond_Success_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Ore_Counter >= 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Success_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Success_15_00"); //¿Qué hay de la carta para lord Hagen?
	AI_Output (self ,other,"DIA_Garond_Success_10_01"); //En total tenemos diez cajones de mineral y hemos perdido el doble de hombres de valía.
	AI_Output (self ,other,"DIA_Garond_Success_10_02"); //Tendrás tu carta. Lord Hagen DEBE enterarse de esto. Este valle está maldito e invadido por el mal.
	
	CreateInvItems (self,ItWr_PaladinLetter_MIS,1);
	B_GiveInvItems (self,other,ItWr_PaladinLetter_MIS,1);
	
	KnowsPaladins_Ore = TRUE;
	
	B_LogEntry (TOPIC_MISOLDWORLD,"El comandante Garond me ha dado una carta. Debería ser prueba suficiente. Puedo llevársela a lord Hagen.");
	
	MIS_ScoutMine = LOG_SUCCESS;
	B_GivePlayerXP (XP_ScoutMine);
	MIS_ReadyForChapter3  = TRUE; 	//Joly: Bei Levelchange ab hier in die Newworld  -> Kapitel 3!!!!!!
	B_NPC_IsAliveCheck (OldWorld_Zen);
};
// ************************************************************
// SLD bezahlen
// ************************************************************

INSTANCE DIA_Garond_SLD (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_SLD_Condition;
	information	= DIA_Garond_SLD_Info;
	permanent	= FALSE;
	description = "¿Y mi paga?";
};                       

FUNC INT DIA_Garond_SLD_Condition()
{
	if (MIS_ScoutMine == LOG_SUCCESS)
	&& (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_SLD_Info()
{		
	AI_Output (other,self ,"DIA_Garond_SLD_15_00"); //¿Y mi paga?
	AI_Output (self ,other,"DIA_Garond_SLD_10_01"); //Oh, sí, claro. Aún te debo algo de oro. Toma tu recompensa.
	B_GiveInvItems (self, other, itMI_Gold, 500);
};
// ************************************************************
// Info Perm wenn Scout Mine == RUNNING
// ************************************************************
INSTANCE DIA_Garond_Running (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 10;
	condition	= DIA_Garond_Running_Condition;
	information	= DIA_Garond_Running_Info;
	permanent	= TRUE;
	description = "¿Cuál es la situación?";
};                       

FUNC INT DIA_Garond_Running_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Ore_Counter < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Running_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Running_15_00"); //¿Cuál es la situación?
	
	if (Ore_Counter == 2) 
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_01"); //Espero recibir noticias de la última mina. Espero que sean buenas.
		
	}
	else if (Ore_Counter == 1) 
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_02"); //Necesito informes de las otras dos minas. Entonces veremos.
	}
	else //0
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_03"); //Tienes que salir a buscar las minas. Estoy impaciente por saber cómo va la extracción de mineral.
	};
	
};
// ************************************************************
// Gorn
// ************************************************************

INSTANCE DIA_Garond_Gorn (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Gorn_Condition;
	information	= DIA_Garond_Gorn_Info;
	permanent	= FALSE;
	description = "Quiero que dejes libre a Gorn.";
};                       

FUNC INT DIA_Garond_Gorn_Condition()
{
	if (Npc_KnowsInfo (other, DIA_MiltenOW_Gorn))
	&& (Kapitel == 2)
	&& (Npc_KnowsInfo (other, DIA_Garond_NeedProof))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Gorn_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Gorn_15_00"); //Quiero que dejes libre a Gorn.
	AI_Output (self ,other,"DIA_Garond_Gorn_10_01"); //No puedo soltarle. Ha cometido muchos crímenes y debe pagar por ellos.
	AI_Output (other,self ,"DIA_Garond_Gorn_15_02"); //¿Puedo pagar la multa por él?
	AI_Output (self ,other,"DIA_Garond_Gorn_10_03"); //Podría ser una posibilidad, pero desde luego no te va a salir barato. Quiero 1000 monedas por Gorn.
	AI_Output (other,self ,"DIA_Garond_Gorn_15_04"); //Eso es mucho oro.
	AI_Output (self ,other,"DIA_Garond_Gorn_10_05"); //Gorn tiene que responder de muchas cosas. Tráeme el oro y le dejaré libre.
	
	MIS_RescueGorn = LOG_RUNNING; 
	B_LogEntry (TOPIC_RescueGorn,"Garond pide mil monedas de oro por liberar a Gorn.");
};
// ************************************************************
// Gorn freikaufen
// ************************************************************

INSTANCE DIA_Garond_Pay (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Pay_Condition;
	information	= DIA_Garond_Pay_Info;
	permanent	= TRUE;
	description = "Quiero comprar la libertad de Gorn. (Pagar 1000 de oro)";
};                       
FUNC INT DIA_Garond_Pay_Condition()
{
	if (MIS_RescueGorn == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Garond_Kerkerauf == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Pay_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Pay_15_00"); //Quiero comprar la libertad de Gorn.
	
	if B_GiveInvItems (other, self, ItMI_Gold, 1000)
	{
		AI_Output (self ,other,"DIA_Garond_Pay_10_01"); //De acuerdo. Puedes ir donde Gerold y decirle en mi nombre que libere a Gorn.
		
		Garond_Kerkerauf = TRUE;
		B_LogEntry (TOPIC_RescueGorn,"He pagado a Garond. Ahora puedo sacar a Gorn de la trena. Gerold, el guardia, le dejará salir.");
	}
	else
	{
		AI_Output (self ,other,"DIA_Garond_Pay_10_02"); //Entonces dame 1000 monedas de oro.
	};	
};
// ************************************************************
// Info Perm in Kap.2
// ************************************************************
INSTANCE DIA_Garond_Perm2 (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 9;
	condition	= DIA_Garond_Perm2_Condition;
	information	= DIA_Garond_Perm2_Info;
	permanent	= TRUE;
	description = "¿Qué piensas hacer ahora?";
};                       

FUNC INT DIA_Garond_Perm2_Condition()
{
	if Npc_KnowsInfo (other,DIA_Garond_Success)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_Perm2_Info()
{		
	AI_Output (other,self ,"DIA_Garond_Perm2_15_00"); //¿Qué piensas hacer ahora?
	AI_Output (self ,other,"DIA_Garond_Perm2_10_01"); //Lo he intentado todo. Ahora eres mi única esperanza, tú y que lord Hagen me mande refuerzos.
	AI_Output (self ,other,"DIA_Garond_Perm2_10_02"); //Continuaremos aguantando y rezando a Innos para que no deje que el desaliento nos invada en estas tristes horas.
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

INSTANCE DIA_Garond_KAP3_EXIT(C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 999;
	condition	= DIA_Garond_KAP3_EXIT_Condition;
	information	= DIA_Garond_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Garond_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WasGibtsNeues
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_WASGIBTSNEUES		(C_INFO)
{
	npc			 = 	PAL_250_Garond;
	nr			 = 	30;
	condition	 = 	DIA_Garond_WASGIBTSNEUES_Condition;
	information	 = 	DIA_Garond_WASGIBTSNEUES_Info;
	permanent	 = 	TRUE;
	description	 = 	"¿Qué hay de nuevo?";
};

func int DIA_Garond_WASGIBTSNEUES_Condition ()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};

func void DIA_Garond_WASGIBTSNEUES_Info ()
{
	AI_Output (other, self, "DIA_Garond_WASGIBTSNEUES_15_00"); //¿Qué hay de nuevo?
	AI_Output (self, other, "DIA_Garond_WASGIBTSNEUES_10_01"); //Maldita sea. ¿Qué haces fastidiando por aquí? ¡Necesito los puñeteros refuerzos!
	AI_Output (self, other, "DIA_Garond_WASGIBTSNEUES_10_02"); //Hasta Milten ha dejado el castillo. Pero no necesito menos hombres, ¡necesito más!
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

INSTANCE DIA_Garond_KAP4_EXIT(C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 999;
	condition	= DIA_Garond_KAP4_EXIT_Condition;
	information	= DIA_Garond_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Garond_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BackInKap4
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_BACKINKAP4		(C_INFO)
{
	npc		 = 	PAL_250_Garond;
	nr		 = 	12;
	condition	 = 	DIA_Garond_BACKINKAP4_Condition;
	information	 = 	DIA_Garond_BACKINKAP4_Info;
	Permanent	 =	FALSE;
	description	 = 	"He vuelto.";
};

func int DIA_Garond_BACKINKAP4_Condition ()
{
	if (Kapitel == 4)
		{
				return TRUE;
		};
};

func void DIA_Garond_BACKINKAP4_Info ()
{
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_00"); //He vuelto.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_01"); //Ya lo veo. ¿Dónde están los refuerzos?
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_02"); //Lord Hagen vendrá tan pronto como lo arregle todo. Han ocurrido muchas cosas.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_03"); //No me importa. Necesito tropas. Cada vez hay más y más orcos y no podremos aguantar mucho más.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_04"); //Mis hombres están cansados y nos estamos quedando sin provisiones.
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_05"); //Han llegado algunos voluntarios.

	if (hero.guild == GIL_DJG)
	{
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_06"); //Te refieres a ti y a tus compañeros cazadores de dragones, ¿no? Podéis ayudarnos pero no sois suficientes.
	}
	else
	{
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_07"); //¿Te refieres a los cazadores de dragones del patio? Pueden ayudarnos, pero son muy pocos.
	};
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_08"); //Si Hagen no manda pronto refuerzos, no puedo garantizar nada.

	B_InitNpcGlobals ();//Joly: zur Sicherheit

	//	Angar wird zum Stonehenge geschickt
	//-----------------------------------------
	AI_Teleport 		 (DJG_Angar,"OW_DJG_WATCH_STONEHENGE_01");	
	B_StartOtherRoutine 	(DJG_Angar,"Start");
	DJG_Angar_SentToStones = TRUE;


	// Die Drachenjäger vom Spielstart verziehen sich in ihr Lager.
	//-----------------------------------------
	B_StartOtherRoutine 	(Kjorn,	"START");
	B_StartOtherRoutine 	(Godar,	"START");
	B_StartOtherRoutine 	(Hokurn,"START");
	B_StartOtherRoutine 	(PC_Fighter_DJG,"START");
	B_StartOtherRoutine  (Kurgan,"START");

	if 	(DJG_BiffParty == FALSE)
	{
	B_StartOtherRoutine 	(Biff,"START");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DragonPlettBericht
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_DragonPlettBericht		(C_INFO)
{
	npc			 = 	PAL_250_Garond;
	nr			 = 	11;
	condition	 = 	DIA_Garond_DragonPlettBericht_Condition;
	information	 = 	DIA_Garond_DragonPlettBericht_Info;
	permanent	 = 	TRUE;
	description	 = 	"Acerca de los dragones...";
};

var int DIA_Garond_DragonPlettBericht_NoPerm;
func int DIA_Garond_DragonPlettBericht_Condition ()
{
	if (Kapitel >= 4)
	&& (Npc_KnowsInfo(other, DIA_Garond_BACKINKAP4))
	&& (DIA_Garond_DragonPlettBericht_NoPerm == FALSE)
	{
		return TRUE;
	};
};

var int Garond_DragonCounter;
var int Garond_SwampdragonKilled_OneTime;
var int Garond_RockdragonKilled_OneTime;
var int Garond_FireDragonKilled_OneTime;
var int Garond_IcedragonKilled_OneTime;
var int Garond_OricExperte_OneTime;
func void DIA_Garond_DragonPlettBericht_Info ()
{
	B_LogEntry (TOPIC_DRACHENJAGD,"Seguro que a Garond le interesa todo lo que tiene que ver con los dragones, aunque quiere dar la impresión de que le importa un carajo."); 

	if (Garond_DragonCounter < MIS_KilledDragons)
	{
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_00"); //Tengo noticias de los dragones.
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_01"); //Informa.
		
		var int CurrentDragonCount;
		var int Drachengeld;
		var int XP_LocalGarond;
		
		CurrentDragonCount = 0;	//Joly: funzt sonst nicht. Keine Ahnung warum!
	
		if (Npc_IsDead(Swampdragon))
		&& (Garond_SwampdragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_02"); //He matado al dragón de la ciénaga que está al este de aquí.
			Garond_SwampdragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(Rockdragon))
		&& (Garond_RockdragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_03"); //El dragón de la fortaleza rocosa del sur está muerto.
			Garond_RockdragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(FireDragon))
		&& (Garond_FireDragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_04"); //El dragón de fuego del volcán del sur ya no causará más destrozos.
			Garond_FireDragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(Icedragon))
		&& (Garond_IcedragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_05"); //Fui a la región helada del oeste y acabé con el dragón que había allí.
			Garond_IcedragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};

		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_06"); //Ésa es una buena noticia. Toma. Te daré dinero para que adquieras equipo.
		
		DrachenGeld = (CurrentDragonCount * Garond_KilledDragonGeld);
		XP_LocalGarond =  (CurrentDragonCount * XP_Garond_KilledDragon);

		B_GivePlayerXP (XP_LocalGarond);

		CreateInvItems (self, ItMi_Gold, DrachenGeld);									
		B_GiveInvItems (self, other, ItMi_Gold, DrachenGeld);					

		Garond_DragonCounter = MIS_KilledDragons;

		if (MIS_AllDragonsDead == TRUE)
		{
			DIA_Garond_DragonPlettBericht_NoPerm = TRUE;
		};
	};
		
	if (Garond_OricExperte_OneTime == FALSE)
	&& ((Npc_IsDead(Oric))	== FALSE)
	&& (MIS_AllDragonsDead == FALSE)
	{
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_07"); //¿Puedes darme más información acerca de los dragones?
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_08"); //Tengo otras cosas de qué preocuparme. Mi oficial estratégico, Oric, puede contarte más cosas de ellos.
		B_LogEntry (TOPIC_DRACHENJAGD,"El oficial estratégico de Garond, Oric, puede tener información que me resulte útil."); 
		Garond_OricExperte_OneTime = TRUE;
	}
	else if (MIS_AllDragonsDead == FALSE)
	{
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_09"); //Entretanto, ¿se han producido más ataques de dragones?
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_10"); //Por suerte, no. Por el momento están controlados.
	};
};

//*********************************************************************
//	Ich habe alle drachen getötet
//*********************************************************************

///////////////////////////////////////////////////////////////////////
//	Info BackInKap4
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_AllDragonDead		(C_INFO)
{
	npc			 = 	PAL_250_Garond;
	nr			 = 	12;
	condition	 = 	DIA_Garond_AllDragonDead_Condition;
	information	 = 	DIA_Garond_AllDragonDead_Info;
	Permanent	 =	FALSE;
	description	 = 	"Todos los dragones están muertos.";
};

func int DIA_Garond_AllDragonDead_Condition ()
{
	if (MIS_AllDragonsDead == TRUE)
	&& (DIA_Garond_DragonPlettBericht_NoPerm == TRUE)	
	&& (Kapitel >= 4)
	{
			return TRUE;
	};
};

func void DIA_Garond_AllDragonDead_Info ()
{
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_00"); //Todos los dragones están muertos.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_01"); //(Con incredulidad) ¿Todos? ¿Así que el mal ha desaparecido para siempre?
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_02"); //No, por desgracia no. Su jefe sigue vivo.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_03"); //¿No eran los dragones los que lideraban a los orcos?
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_04"); //Sí, es cierto, pero a su vez estaban a las órdenes de un amo. También tendremos que librarnos de él.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_05"); //Nada de irme. Tengo que guardar el mineral y los condenados orcos siguen siendo un problema.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_06"); //Tendrás que cuidarte solo. No puedo ayudarte.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_07"); //Que Innos te proteja.
};

///////////////////////////////////////////////////////////////////////
//	Mission JanBecomeSmith
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_JanBecomeSmith		(C_INFO)
{
	npc			= 	PAL_250_Garond;
	nr		 	= 	12;
	condition	= 	DIA_Garond_JanBecomeSmith_Condition;
	information	= 	DIA_Garond_JanBecomeSmith_Info;
	Permanent	=	TRUE;
	description	= 	"Hay un problema con el herrero.";
};

func int DIA_Garond_JanBecomeSmith_Condition ()
{
	if (MIS_JanBecomesSmith == LOG_RUNNING)
		&& (Kapitel >= 4)
	{
			return TRUE;
	};
};

func void DIA_Garond_JanBecomeSmith_Info ()
{
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_00"); //Hay un problema con el herrero.
	AI_Output			(self ,other, "DIA_Garond_JanBecomeSmith_10_01"); //¿Qué herrero? Ha desaparecido en la carpintería.
	AI_Output			(self ,other, "DIA_Garond_JanBecomeSmith_10_02"); //¿Ha vuelto? Entonces le puedes decir...
	AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_03"); //No, me refiero a Jan.

	if (hero.guild == GIL_DJG)
	{
		AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_04"); //Es cazador de dragones, como yo, y un buen herrero.
	}
	else
	{
		AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_05"); //Uno de los cazadores de dragones. Es herrero.
	};	

	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_06"); //Está bien. Nuestro anterior herrero salió huyendo, el muy cobarde.
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_07"); //Jan podría estar dispuesto a encargarse de la herrería.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_08"); //Ya veo. Así que crees que se puede confiar en él.
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_09"); //Sí.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_10"); //Si estás tan seguro, entonces puedes responder por él.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_11"); //Si causa algún problema, responderás por él, ¿de acuerdo?
	
	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
	Info_AddChoice 		(DIA_Garond_JanBecomeSmith,"Me lo pensaré.",DIA_Garond_JanBecomeSmith_No);
	Info_AddChoice		(DIA_Garond_JanBecomeSmith,"Yo respondo por Jan.",DIA_Garond_JanBecomeSmith_Yes); 		
};

FUNC VOID DIA_Garond_JanBecomeSmith_No ()
{
	AI_Output (other,self ,"DIA_Garond_JanBecomeSmith_No_15_00"); //Me lo pensaré.
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_No_10_01"); //¿Cómo voy a confiar en él si ni siquiera tú lo haces?
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_No_10_02"); //Si no hay nadie que responda por él, ese Jan no se acercará a la forja.

	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
};

FUNC VOID DIA_Garond_JanBecomeSmith_Yes()
{
	AI_Output (other,self ,"DIA_Garond_JanBecomeSmith_Yes_15_00"); //Yo respondo por Jan.
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_Yes_10_01"); //De acuerdo, puede usar la herrería. Por supuesto, tendrá que proporcionar espadas a mis hombres.
	
	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
	MIS_JanBecomesSmith = LOG_SUCCESS; 
	B_GivePlayerXP (XP_Ambient);
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

INSTANCE DIA_Garond_KAP5_EXIT(C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 999;
	condition	= DIA_Garond_KAP5_EXIT_Condition;
	information	= DIA_Garond_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Garond_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info perm5
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_PERM5		(C_INFO)
{
	npc		 = 	PAL_250_Garond;
	nr		 = 	59;
	condition	 = 	DIA_Garond_PERM5_Condition;
	information	 = 	DIA_Garond_PERM5_Info;
	permanent	 = 	TRUE;

	description	 = 	"¿Cómo van las cosas?";
};

func int DIA_Garond_PERM5_Condition ()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};

func void DIA_Garond_PERM5_Info ()
{
	AI_Output			(other, self, "DIA_Garond_PERM5_15_00"); //¿Cuál es la situación?

	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output			(self, other, "DIA_Garond_PERM5_10_01"); //¡Un condenado desastre! Algún bastardo dejó abierta la puerta principal. Ahora no somos más que carne muerta.
	AI_Output			(self, other, "DIA_Garond_PERM5_10_02"); //Cuando ponga la mano encima al traidor...
	}
	else
	{
	AI_Output			(self, other, "DIA_Garond_PERM5_10_03"); //Como Hagen no llegue pronto, vamos a caer como moscas.
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


INSTANCE DIA_Garond_KAP6_EXIT(C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 999;
	condition	= DIA_Garond_KAP6_EXIT_Condition;
	information	= DIA_Garond_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Garond_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garond_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
































