// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Andre_EXIT   (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 999;
	condition   = DIA_Andre_EXIT_Condition;
	information = DIA_Andre_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Andre_EXIT_Condition()
{	
	if (self.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Andre_EXIT_Info()
{
	AI_StopProcessInfos (self);

};
// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Andre_FIRSTEXIT   (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 999;
	condition   = DIA_Andre_FIRSTEXIT_Condition;
	information = DIA_Andre_FIRSTEXIT_Info;
	permanent   = FALSE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Andre_FIRSTEXIT_Condition()
{	
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Andre_FIRSTEXIT_Info()
{
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
	B_StartOtherRoutine (Wulfgar,"START"); 
};




// ************************************************************
// 	  				   		Steckbrief
// ************************************************************
var int Andre_Steckbrief; //damit es nur EINMAL kommt
// ------------------------

func void B_Andre_Steckbrief()
{
	AI_Output (self ,other,"DIA_Andre_Add_08_00"); //Uno de mis hombres me ha dicho que los bandidos están repartiendo carteles con tu retrato.
	AI_Output (self ,other,"DIA_Andre_Add_08_01"); //También dice que al principio lo negaste.
	AI_Output (self ,other,"DIA_Andre_Add_08_02"); //¿De qué va todo esto?
	AI_Output (other, self,"DIA_Andre_Add_15_03"); //No sé por qué me buscan esos tipos...
	AI_Output (self ,other,"DIA_Andre_Add_08_04"); //Por tu bien espero que digas la verdad.
	AI_Output (self ,other,"DIA_Andre_Add_08_05"); //En la milicia no puede alistarse nadie con antecedentes.
	AI_Output (self ,other,"DIA_Andre_Add_08_06"); //Casi todos los bandidos son antiguos presos de la colonia penal.
	AI_Output (self ,other,"DIA_Andre_Add_08_07"); //¡Espero que no hayas tenido nada que ver con esos asesinos!
	Andre_Steckbrief = TRUE;
};

// ************************************************************
// 	  				   	Canthar Falle 
// ************************************************************
var int Andre_CantharFalle; //damit es nur EINMAL kommt
// ------------------------

func void B_Andre_CantharFalle()
{
	AI_Output (self, other, "B_Andre_CantharFalle_08_00"); //El mercader Canthar vino y nos dijo que eras un preso fugado de la colonia minera.
	AI_Output (self, other, "B_Andre_CantharFalle_08_01"); //No sé si es cierto y prefiero no preguntarte, pero deberías solucionar el asunto.
	
	B_RemoveNpc (Sarah);
	
			
	B_StartOtherRoutine (Canthar,"MARKTSTAND");
	AI_Teleport (Canthar,"NW_CITY_SARAH");
					
	if (Canthar_Sperre == FALSE)
	&& (Canthar_Pay == FALSE)
	{
		Canthar_Sperre = TRUE; 
	};
	
	MIS_Canthars_KomproBrief = LOG_OBSOLETE;
	B_CheckLog();
	
	Andre_CantharFalle = TRUE;
};

// ************************************************************
// 			Canthar Falle als INFO (niedrige Important)
// ************************************************************

INSTANCE DIA_Andre_CantharFalle (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 3;
	condition   = DIA_Andre_CantharFalle_Condition;
	information = DIA_Andre_CantharFalle_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Andre_CantharFalle_Condition()
{
	if (MIS_Canthars_KomproBrief == LOG_RUNNING) 
	&& (MIS_Canthars_KomproBrief_Day <= Wld_GetDay() - 2)
	&& (Andre_CantharFalle == FALSE)
	{
		return TRUE;
	};
	
	if (Pablo_AndreMelden == TRUE)
	&& (!Npc_IsDead(Pablo))
	&& (Andre_Steckbrief == FALSE)
	{
		return TRUE;
	};
};

FUNC INT DIA_Andre_CantharFalle_Info()
{
	if (Andre_Steckbrief == FALSE)
	{
		B_Andre_Steckbrief();
	};
	
	if (Andre_CantharFalle == FALSE)
	&& (MIS_Canthars_KomproBrief_Day <= Wld_GetDay() - 2)
	{
		B_Andre_CantharFalle();
	};
};

// ************************************************************
// 					Petzmaster: Schulden offen 
// ************************************************************

// ---------------------------
var int Andre_LastPetzCounter;
var int Andre_LastPetzCrime;
// ---------------------------

INSTANCE DIA_Andre_PMSchulden (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 1;
	condition   = DIA_Andre_PMSchulden_Condition;
	information = DIA_Andre_PMSchulden_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Andre_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Andre_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Andre_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Andre_PMSchulden_Info()
{
	AI_Output (self, other, "DIA_Andre_PMSchulden_08_00"); //¿Has venido a pagar la multa?

						
						// ------ STECKBRIEF ------
						if (Pablo_AndreMelden == TRUE)
						&& (!Npc_IsDead(Pablo))
						&& (Andre_Steckbrief == FALSE)
						{
							B_Andre_Steckbrief();
						};
						
						// ------- CANTHAR -------
						if (MIS_Canthars_KomproBrief == LOG_RUNNING) 
						&& (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2))
						&& (Andre_CantharFalle == FALSE)
						{
							B_Andre_CantharFalle();	
						};

	if (B_GetTotalPetzCounter(self) > Andre_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_01"); //¡Me preguntaba si te atreverías a venir!
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_02"); //¡Por lo visto, las acusaciones en tu contra se han multiplicado!
		if (Andre_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_03"); //¡Te lo advertí! ¡Ahora la multa que tienes que pagar ha subido!
			AI_Output (other, self, "DIA_Andre_PMAdd_15_00"); //¿Cuánto?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Andre_LastPetzCounter);
		
			if (diff > 0)
			{
				Andre_Schulden = Andre_Schulden + (diff * 50);
			};
		
			if (Andre_Schulden > 1000)	{	Andre_Schulden = 1000;	};
		
			B_Say_Gold (self, other, Andre_Schulden);
		}
		else
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_04"); //¡Me has defraudado muchísimo!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Andre_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_05"); //Hay unas cuantas novedades.
		
		if (Andre_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_06"); //De pronto, no queda nadie que te acuse de asesinato.
		};
		
		if (Andre_LastPetzCrime == CRIME_THEFT)
		|| ( (Andre_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_07"); //Nadie se acuerda de haberte visto robar.
		};
		
		if (Andre_LastPetzCrime == CRIME_ATTACK)
		|| ( (Andre_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_08"); //Ya no hay testigos de tu implicación en una pelea.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_09"); //Parece que se han retirado todos los cargos en tu contra.
		};
		
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_10"); //No sé cómo ha sido, pero te lo advierto: no me la juegues.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_11"); //En cualquier caso, he decidido no reclamarte tus deudas.
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_12"); //Procura no meterte en más líos.
	
			Andre_Schulden			= 0;
			Andre_LastPetzCounter 	= 0;
			Andre_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_13"); //Quiero que quede clara una cosa: de todas maneras vas a pagar la suma total de tus multas.
			B_Say_Gold (self, other, Andre_Schulden);
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_14"); //¿Qué ocurre?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Andre_PMSchulden);
		Info_ClearChoices  	(DIA_Andre_PETZMASTER);
		Info_AddChoice		(DIA_Andre_PMSchulden,"¡No tengo bastante oro!",DIA_Andre_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Andre_PMSchulden,"¿Dime otra vez cuánto era?",DIA_Andre_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
		{
			Info_AddChoice 	(DIA_Andre_PMSchulden,"¡Quiero pagar la multa!",DIA_Andre_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Andre_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Andre_PMSchulden_HowMuchAgain_15_00"); //¿Y cuánto era?
	B_Say_Gold (self, other, Andre_Schulden);

	Info_ClearChoices  	(DIA_Andre_PMSchulden);
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_AddChoice		(DIA_Andre_PMSchulden,"¡No tengo bastante oro!",DIA_Andre_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Andre_PMSchulden,"¿Dime otra vez cuánto era?",DIA_Andre_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice 	(DIA_Andre_PMSchulden,"¡Quiero pagar la multa!",DIA_Andre_PETZMASTER_PayNow);
	};
};

// ### weitere Choices siehe unten (DIA_Andre_PETZMASTER) ###


// ************************************************************
// 			  			 PETZ-MASTER 
// ************************************************************

instance DIA_Andre_PETZMASTER   (C_INFO)
{
	npc         = Mil_311_Andre;
	nr          = 1;
	condition   = DIA_Andre_PETZMASTER_Condition;
	information = DIA_Andre_PETZMASTER_Info;
	permanent   = TRUE;
	important	= TRUE;
};
FUNC INT DIA_Andre_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Andre_LastPetzCrime)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Andre_PETZMASTER_Info()
{
	Andre_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	// ------ SC hat mit Andre noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_00"); //Debes de ser el tipo nuevo que ha armado tanto follón en la ciudad.
	};
	
						// ------ STECKBRIEF ------
						if (Pablo_AndreMelden == TRUE)
						&& (!Npc_IsDead(Pablo))
						&& (Andre_Steckbrief == FALSE)
						{
							B_Andre_Steckbrief();
						};	
	
						// ------- CANTHAR -------
						if (MIS_Canthars_KomproBrief == LOG_RUNNING) 
						&& (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2))
						&& (Andre_CantharFalle == FALSE)
						{
							B_Andre_CantharFalle();	
						};
	
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_01"); //Me alegro de que vinieras antes de que las cosas se te pusieran peor.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_02"); //¡El asesinato es un crimen muy grave!
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Andre_Schulden = Andre_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_03"); //Y no digo nada de todo lo demás que has hecho.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_04"); //La guardia tiene orden de ejecutar en el acto a los asesinos.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_05"); //¡Y la mayoría de los ciudadanos no tolera la presencia de un asesino en la ciudad!
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_06"); //No me interesa ahorcarte. Estamos en guerra y necesitamos hasta el último hombre.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_07"); //Pero costará que la gente vuelva a estar a bien contigo.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_08"); //Podrías demostrar tu arrepentimiento pagando una multa. Por supuesto, tendría que ser razonablemente alta.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_09"); //¡Me alegro de que hayas venido! ¡Se te acusa de robo y hay testigos!
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_10"); //No mencionaré las otras cosas que he oído.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_11"); //¡No toleraré una conducta así en la ciudad!
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_12"); //Para expiar tu crimen, tienes que pagar una multa.
		
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_13"); //Una cosa es pelearse con la chusma en el puerto...
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_14"); //Pero si atacas a ciudadanos, o a los soldados del rey, debo llevarte ante la justicia.
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_15"); //Y lo de la oveja tampoco era necesario.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_16"); //Si dejo que te vayas de rositas, la gente no tardará en hacer lo que le parezca.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_17"); //Así que pagarás una multa adecuada y el asunto pasará al olvido.
		
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_18"); //Tengo entendido que fuiste a por nuestra oveja.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_19"); //Comprendes que no puedo pasarlo por alto.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_20"); //¡Tendrás que pagar una indemnización!
		
		Andre_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Andre_PETZMASTER_15_21"); //¿Cuánto?
	
	if (Andre_Schulden > 1000)	{	Andre_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Andre_Schulden);
	
	Info_ClearChoices  	(DIA_Andre_PMSchulden);
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_AddChoice		(DIA_Andre_PETZMASTER,"¡No tengo bastante oro!",DIA_Andre_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice 	(DIA_Andre_PETZMASTER,"¡Quiero pagar la multa!",DIA_Andre_PETZMASTER_PayNow);
	};
};

func void DIA_Andre_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Andre_PETZMASTER_PayNow_15_00"); //¡Quiero pagar la multa!
	B_GiveInvItems (other, self, itmi_gold, Andre_Schulden);
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayNow_08_01"); //¡Bien! Me ocuparé de que se entere todo el mundo. Eso servirá para restaurar tu reputación hasta cierto punto.

	B_GrantAbsolution (LOC_CITY);
	
	Andre_Schulden			= 0;
	Andre_LastPetzCounter 	= 0;
	Andre_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_ClearChoices  	(DIA_Andre_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Andre_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Andre_PETZMASTER_PayLater_15_00"); //No tengo suficiente oro.
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayLater_08_01"); //Entonces tendrás que procurarte el oro lo antes posible.
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayLater_08_02"); //Y, te lo advierto, si empeoras tus crímenes la situación también empeorará.
	
	Andre_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Andre_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};
// *********************************************************
//							Hallo
// *********************************************************
instance DIA_Andre_Hallo		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_Hallo_Condition;
	information	 = 	DIA_Andre_Hallo_Info;
	permanent 	 =  FALSE; 
	important    =  TRUE;
};
func int DIA_Andre_Hallo_Condition ()
{
	if Npc_IsInState (self, ZS_Talk)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Andre_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Andre_Hallo_08_00"); //¡Que Innos te acompañe, forastero! ¿Qué te trae hasta mí?
};



// *********************************************************
//					Nachricht für Lord Hagen
// *********************************************************
instance DIA_Andre_Message		(C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 1;
	condition	= DIA_Andre_Message_Condition;
	information	= DIA_Andre_Message_Info;
	permanent 	= FALSE; 
	description = "Tengo un mensaje importante para lord Hagen.";
};
func int DIA_Andre_Message_Condition ()
{
	if (Kapitel < 3)
	&& ((hero.guild == GIL_NONE)
	|| (hero.guild == GIL_NOV))
	{
		return TRUE;
	};	
};
func void DIA_Andre_Message_Info ()
{
	AI_Output (other, self, "DIA_Andre_Message_15_00"); //Tengo un mensaje importante para lord Hagen.
	AI_Output (self, other, "DIA_Andre_Message_08_01"); //Tienes delante a uno de sus hombres. ¿De qué se trata?
	
	Info_ClearChoices (DIA_Andre_Message);
	Info_AddChoice (DIA_Andre_Message, "Eso se lo tengo que contar a lord Hagen en persona.", DIA_Andre_Message_Personal);
	Info_AddChoice (DIA_Andre_Message, "¡Las huestes orcos están encabezadas por DRAGONES!", DIA_Andre_Message_Dragons);
	Info_AddChoice (DIA_Andre_Message, "Es sobre un artefacto sagrado, el Ojo de Innos.", DIA_Andre_Message_EyeInnos);
};

func void B_Andre_LordHagenNichtZuSprechen()
{
	AI_Output (self, other, "B_Andre_LordHagenNichtZuSprechen_08_00"); //Lord Hagen solo recibe a paladines o a aquellos que estén al servicio de los paladines.
	AI_Output (self, other, "B_Andre_LordHagenNichtZuSprechen_08_01"); //Se considera que perder el tiempo con la plebe es algo indigno de su puesto.
};

func void DIA_Andre_Message_EyeInnos()
{
	AI_Output (other, self, "DIA_Andre_Message_EyeInnos_15_00"); //Es sobre un artefacto sagrado, el Ojo de Innos.
	AI_Output (self, other, "DIA_Andre_Message_EyeInnos_08_01"); //El Ojo de Innos... No tengo ni idea de lo que es, pero eso no significa nada.
	AI_Output (self, other, "DIA_Andre_Message_EyeInnos_08_02"); //De todos modos, si existe un artefacto llamado así, solo los miembros de mayor rango de nuestra orden estarían al tanto de su existencia.
	AI_Output (other, self, "DIA_Andre_Message_EyeInnos_15_03"); //Por eso tengo que hablar con lord Hagen en persona.
	
	Andre_EyeInnos = TRUE;
	
	B_Andre_LordHagenNichtZuSprechen();
	
	Info_ClearChoices (DIA_Andre_Message);
};
func void DIA_Andre_Message_Dragons()
{
	AI_Output (other, self, "DIA_Andre_Message_Dragons_15_00"); //Las huestes orcos están encabezadas por dra...
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_01"); //(Interrumpiendo) Ya sé que los ejércitos de los orcos se están reforzando.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_02"); //No me irás a decir que es eso lo que quieres contarle a lord Hagen.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_03"); //Te arrancaría la cabeza si le hicieras perder el tiempo con esas historias.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_04"); //Y estoy seguro de que eres lo bastante listo para saberlo.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_05"); //Bueno, ¿de qué va esto en realidad?
};
func void DIA_Andre_Message_Personal()
{
	AI_Output (other, self, "DIA_Andre_Message_Personal_15_00"); //Eso se lo tengo que contar a lord Hagen en persona.
	AI_Output (self, other, "DIA_Andre_Message_Personal_08_01"); //Haz lo que quieras. Pero has de saber una cosa:
	B_Andre_LordHagenNichtZuSprechen();
	
	Info_ClearChoices (DIA_Andre_Message);
};
// *********************************************************
//	Warum seid ihr Paladine in der Stadt? 
// *********************************************************
instance DIA_Andre_Paladine		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	3;
	condition	 = 	DIA_Andre_Paladine_Condition;
	information	 = 	DIA_Andre_Paladine_Info;
	permanent 	 =  FALSE; 
	description	 = 	"¿Qué hacéis los paladines en la ciudad?";	
};
func int DIA_Andre_Paladine_Condition ()
{	
	if (other.guild != GIL_MIL)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Andre_Paladine_Info ()
{
	AI_Output (other, self, "DIA_Andre_Paladine_15_00"); //¿Qué hacéis los paladines en la ciudad?
	AI_Output (self, other, "DIA_Andre_Paladine_08_01"); //Los objetivos de nuestra misión son secretos.
	AI_Output (self, other, "DIA_Andre_Paladine_08_02"); //Lo único que puedo contarte es que los ciudadanos no corren ningún peligro.
	AI_Output (self, other, "DIA_Andre_Paladine_08_03"); //No hace falta que te preocupes.
};
// *********************************************************
//	Warum seid ihr Paladine in der Stadt? 
// *********************************************************
instance DIA_Andre_PaladineAgain		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	3;
	condition	 = 	DIA_Andre_PaladineAgain_Condition;
	information	 = 	DIA_Andre_PaladineAgain_Info;
	permanent 	 =  FALSE; 
	description	 = 	"¿Qué hacéis los paladines en la ciudad?";	
};
func int DIA_Andre_PaladineAgain_Condition ()
{	
	if (other.guild == GIL_MIL)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Andre_PaladineAgain_Info ()
{
	if Npc_KnowsInfo (other,DIA_Andre_Paladine)
	{
		AI_Output (other, self, "DIA_Andre_PaladineAgain_15_00"); //¿Me vas a contar ahora por qué habéis venido los paladines a Khorinis?
	}
	else
	{
		AI_Output (other, self, "DIA_Andre_PaladineAgain_15_01"); //¿Qué hacéis los paladines en la ciudad?
	};
	
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_02"); //Ahora perteneces a la guardia de la ciudad, y por lo tanto también estás a las órdenes de los paladines.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_03"); //Ya puedo revelártelo.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_04"); //Hemos venido a cumplir una misión para el rey Rhobar. A causa de la caída de la barrera, se han interrumpido las entregas de mineral.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_05"); //Por lo tanto, nosotros nos encargamos de recoger el oro y llevarlo al continente. Con el mineral forjaremos nueva armas y rechazaremos a los orcos.
	
	KnowsPaladins_Ore = TRUE;
};
// *********************************************************
//						AskToJoin
// *********************************************************
instance DIA_Andre_AskToJoin		(C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 2;
	condition	= DIA_Andre_AskToJoin_Condition;
	information	= DIA_Andre_AskToJoin_Info;
	permanent 	= FALSE; 
	description = "¡Quiero enrolarme en los paladines!";
};
func int DIA_Andre_AskToJoin_Condition ()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};	
};
func void DIA_Andre_AskToJoin_Info ()
{
	AI_Output (other, self, "DIA_Andre_AskToJoin_15_00"); //¡Quiero enrolarme en los paladines!

	if (Npc_KnowsInfo(other,DIA_Andre_Message))
	{
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_01"); //Bien. Recibimos de buen grado a todos los hombres capaces. No nos importan los motivos que les impulsen a alistarse.
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_02"); //Si te pones al servicio de los paladines, te ayudaré a que lord Hagen te reciba en audiencia.
	}
	else
	{
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_03"); //Una petición honorable.
	};
	
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_04"); //Sin embargo, me han ordenado que solo acepte a ciudadanos en la milicia.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_05"); //Mi comandante tiene miedo de que se infiltren espías o saboteadores.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_06"); //Quiere limitar el riesgo de este modo.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_07"); //Por lo tanto, antes debes hacerte ciudadano. No está claro si la norma tiene algún sentido, pero ésa es la orden.
	
	Log_CreateTopic (TOPIC_BecomeMIL,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BecomeMIL,LOG_RUNNING);
	B_LogEntry (TOPIC_BecomeMIL,"Antes de poder convertirme en miembro de la guardia de la ciudad, debo ser ciudadano.");
};

// *********************************************************
//						About Miliz
// *********************************************************
instance DIA_Andre_AboutMiliz (C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	5;
	condition	 = 	DIA_Andre_AboutMiliz_Condition;
	information	 = 	DIA_Andre_AboutMiliz_Info;
	permanent    =  FALSE;
	description	 = 	"¿Qué expectativas tengo en la milicia?";
};

func int DIA_Andre_AboutMiliz_Condition ()
{	
	if (other.guild == GIL_NONE)
	&& (Npc_KnowsInfo (other, DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Andre_ABOUTMILIZ_Info ()
{
	AI_Output (other, self, "DIA_Andre_AboutMiliz_15_00"); //¿Qué expectativas tengo en la milicia?
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_01"); //Voy a dejarte clara una cosa. Ser soldado de la milicia significa mucho más que pasearse por la ciudad de uniforme.
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_02"); //Es un trabajo sucio e incluso sangriento. En cuanto seas uno de los nuestros, te esperará mucho trabajo.
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_03"); //Pero merece la pena. Además de la paga, algún día puedes tener la oportunidad de convertirte en guerrero sagrado de Innos.
};
			
///////////////////////////////////////////////////////////////////////
//	Info MartinEmpfehlung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_MartinEmpfehlung		(C_INFO)
{
	npc		 = 	Mil_311_Andre;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Andre_MartinEmpfehlung_Condition;
	information	 = 	DIA_Addon_Andre_MartinEmpfehlung_Info;

	description	 = 	"Mira, tengo esta carta de recomendación de tu maestro de provisiones.";
};

func int DIA_Addon_Andre_MartinEmpfehlung_Condition ()
{
	if (Npc_HasItems (other,ItWr_Martin_MilizEmpfehlung_Addon))
	&& (Npc_KnowsInfo(other,DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_MartinEmpfehlung_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Andre_MartinEmpfehlung_15_00"); //Mira, tengo esta carta de recomendación de tu maestro de provisiones.
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_01"); //(incrédulo) ¿Qué? A ver.
	B_GiveInvItems (other, self, ItWr_Martin_MilizEmpfehlung_Addon,1);
	B_UseFakeScroll();
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_02"); //(impresionado) Vaya, yo… Esto debe de haberte costado mucho. No es tarea fácil sacarle algo como esto a Martin.
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_03"); //Muy bien. Estoy convencido. Si Martin responde por ti, dejaré que te nos unas. Cuando estés listo, házmelo saber.
	Andre_Knows_MartinEmpfehlung = TRUE;
};

// *********************************************************
//						Alternative			//e2
// *********************************************************
instance DIA_Andre_Alternative (C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 2;
	condition	= DIA_Andre_Alternative_Condition;
	information	= DIA_Andre_Alternative_Info;
	permanent 	= FALSE; 
	description = "¿Hay algún método más rápido para alistarme?";
};
func int DIA_Andre_Alternative_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Andre_AskToJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Andre_Alternative_Info ()
{
	AI_Output (other, self, "DIA_Andre_Alternative_15_00"); //¿Hay algún método más rápido para alistarme?
	AI_Output (self, other, "DIA_Andre_Alternative_08_01"); //Um (se para en seco)... lo dices en serio, ¿verdad?
	AI_Output (self, other, "DIA_Andre_Alternative_08_02"); //Bueno, mira... Tengo un problema. Si me lo resuelves, me aseguraré de que seas admitido en la milicia.
	AI_Output (self, other, "DIA_Andre_Alternative_08_03"); //Pero lo más importante es que no le digas nada a nadie.
	
	
};

// *********************************************************
//						GuildOfThieves			//e3
// *********************************************************
instance DIA_Andre_GuildOfThieves (C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 2;
	condition	= DIA_Andre_GuildOfThieves_Condition;
	information	= DIA_Andre_GuildOfThieves_Info;
	permanent 	= FALSE; 
	description = "¿Qué te pasa?";
};
func int DIA_Andre_GuildOfThieves_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Andre_Alternative))
	{
		return TRUE;
	};
};
func void DIA_Andre_GuildOfThieves_Info ()
{
	AI_Output (other, self, "DIA_Andre_GuildOfThieves_15_00"); //¿Qué te pasa?
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_01"); //En los últimos tiempos ha habido varios robos en la ciudad. Por ahora no hemos logrado detener a nadie. Los ladrones son demasiado hábiles.
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_02"); //Esa chusma sabe lo que se hace. Seguro que nos enfrentamos a una banda organizada.
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_03"); //No me sorprendería que hubiera un gremio de ladrones en Khorinis. Encuentra a los jefes de la banda y captúralos.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_04"); //Luego me aseguraré de que te admitan en la milicia, seas o no ciudadano.
		AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_05"); //¡Pero no digas nada de nuestro acuerdo!
	};
	
	MIS_Andre_GuildOfThieves = LOG_RUNNING;
	B_LogEntry (TOPIC_BecomeMIL,"Hay otra manera de ser aceptado en la guardia de la ciudad y es buscar y eliminar a la cofradía de ladrones de Khorinis.");
	
};

// *********************************************************
//						WhereThieves			//e4
// *********************************************************
instance DIA_Andre_WhereThieves (C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 2;
	condition	= DIA_Andre_WhereThieves_Condition;
	information	= DIA_Andre_WhereThieves_Info;
	permanent 	= FALSE; 
	description = "¿Dónde empiezo a buscar a los ladrones?";
};
func int DIA_Andre_WhereThieves_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Andre_GuildOfThieves))
	&& (MIS_Andre_GuildOfThieves == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Andre_WhereThieves_Info ()
{
	AI_Output (other, self, "DIA_Andre_WhereThieves_15_00"); //¿Dónde empiezo a buscar a los ladrones?
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_01"); //¡Si lo supiera, ya iría yo!
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_02"); //Solo puedo contarte que hace poco pusimos patas arriba todo el distrito portuario y no encontramos nada, absolutamente nada.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_03"); //Allí la gente no habla mucho, sobre todo si llevas armadura de paladín.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_04"); //Pero tú eres forastero, y tardarán más en desconfiar en ti.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_05"); //En primer lugar podrías preguntar por el puerto, pero ten cuidado. Si la gente se percata de que trabajas para los paladines, no te enterarás de nada.
	
	B_LogEntry (TOPIC_BecomeMIL,"Voy a buscar la cofradía de ladrones, lo mejor sería echar un vistazo en el distrito del puerto.");
};

// *********************************************************
//						WhatToDo			//e4
// *********************************************************
instance DIA_Andre_WhatToDo (C_INFO)
{
	npc			= Mil_311_Andre;
	nr			= 3;
	condition	= DIA_Andre_WhatToDo_Condition;
	information	= DIA_Andre_WhatToDo_Info;
	permanent 	= FALSE; 
	description = "¿Qué hago si encuentro a uno de los ladrones?";
};
func int DIA_Andre_WhatToDo_Condition ()
{
	if (Npc_KnowsInfo(other,DIA_Andre_GuildOfThieves))
	&& (MIS_Andre_GuildOfThieves == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Andre_WhatToDo_Info ()
{
	AI_Output (other, self, "DIA_Andre_WhatToDo_15_00"); //¿Qué hago si encuentro a uno de los ladrones?
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_01"); //Si se trata de un criado, un esbirro o secuaces de poca monta, sería mejor que evitaras una pelea.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_02"); //Mejor preséntate ante mí e infórmame, y yo me aseguraré de que acabe en chirona.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_03"); //Si se produce una pelea, la guardia de la ciudad podría intervenir y no tendrías la oportunidad de explicarles qué sucede.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_04"); //Además, hay recompensa por cada manzana podrida que consigas meter en la cárcel.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_05"); //Sin embargo, si localizas la guarida de los jefes, es probable que no puedas evitar la pelea.
	
	B_LogEntry (TOPIC_BecomeMIL,"Si cojo a un miembro de la cofradía de ladrones, le debería llevar directamente ante lord Andre. Para eliminar la cofradía tendré que encontrar su escondite.");
};

// *********************************************************
//					Verbrecher ausliefern		//e4
// *********************************************************
	
instance DIA_Andre_Auslieferung		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	200;
	condition	 = 	DIA_Andre_Auslieferung_Condition;
	information	 = 	DIA_Andre_Auslieferung_Info;
	permanent    =  TRUE;
	description	 = 	"He venido a cobrar la recompensa por un delincuente.";
};

func int DIA_Andre_Auslieferung_Condition ()
{	
	if (Rengaru_Ausgeliefert == FALSE)
	|| (Halvor_Ausgeliefert == FALSE)
	|| (Nagur_Ausgeliefert == FALSE)
	|| (MIS_Canthars_KomproBrief == LOG_RUNNING)
	{
		return TRUE;
	};	
};

func void DIA_Andre_Auslieferung_Info ()
{
	AI_Output (other, self, "DIA_Andre_Auslieferung_15_00"); //He venido a cobrar la recompensa por un delincuente.
	
	Info_ClearChoices (DIA_Andre_Auslieferung);
	
	Info_AddChoice (DIA_Andre_Auslieferung,"Volveré más tarde. (VOLVER)",DIA_Andre_Auslieferung_Back);
	
	// ------ Rengaru -----
	if (Rengaru_InKnast == TRUE)
	&& (Rengaru_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Rengaru le robó al mercader Hora.",DIA_Andre_Auslieferung_Rengaru);
	};
	// ------ Halvor ------
	if (Betrayal_Halvor == TRUE)
	&& (Halvor_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Halvor vende artículos robados.",DIA_Andre_Auslieferung_Halvor);
	};
	// ------ Nagur ------
	if (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Nagur_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Nagur ha matado al mensajero de Baltram.",DIA_Andre_Auslieferung_Nagur);
	};
	// ------ Canthar -------
	if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (MIS_Canthars_KomproBrief_Day > (Wld_GetDay()-2))
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"¡Canthar intenta librarse de Sarah!",DIA_Andre_Auslieferung_Canthar);
	};
	if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (Npc_HasItems (Sarah, ItWr_Canthars_KomproBrief_MIS) >= 1)
	&& (MIS_Canthars_KomproBrief_Day > (Wld_GetDay()-2))
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Sarah le vende armas a Onar.",DIA_Andre_Auslieferung_Sarah);
	};
};

func void DIA_Andre_Auslieferung_Back()
{
	Info_ClearChoices (DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Rengaru()
{	
	//Rengaru in den Knast beamen
	AI_Teleport			(Rengaru,"NW_CITY_HABOUR_KASERN_RENGARU"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Rengaru_15_00"); //Rengaru le robó al mercader Hora. Intentó salir pitando, pero lo atrapé.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Rengaru_08_01"); //Bien, mis hombres ya le han detenido. No va a robar a nadie en un futuro próximo.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Rengaru_08_02"); //Aquí tienes tu dinero.
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	Rengaru_Ausgeliefert = TRUE;
	MIS_ThiefGuild_sucked = TRUE; 
	B_GivePlayerXP (XP_Andre_Auslieferung);
	Info_ClearChoices (DIA_Andre_Auslieferung);
	
	B_StartOtherRoutine (Rengaru,"PRISON");	
};

func void DIA_Andre_Auslieferung_Halvor()
{
	//Halvor in den Knast beamen
	AI_Teleport			(Halvor,"NW_CITY_HABOUR_KASERN_HALVOR"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Halvor_15_00"); //Halvor es perista. Vende el género que los bandidos le roban a los mercaderes.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Halvor_08_01"); //Así que él está detrás de todo. Mis hombres lo encerrarán de inmediato.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Halvor_08_02"); //No creo que cause dificultades. Voy a darte la recompensa.
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	
	B_StartOtherRoutine (Halvor,"PRISON");
	MIS_ThiefGuild_sucked = TRUE;
	Halvor_Ausgeliefert = TRUE;
	B_GivePlayerXP (XP_Andre_Auslieferung);
	Info_ClearChoices (DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Nagur()
{
	//Nagur in den Knast beamen
	AI_Teleport			(Nagur,"NW_CITY_HABOUR_KASERN_NAGUR"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Nagur_15_00"); //Nagur ha matado al mensajero de Baltram, e intentó que yo me pasara por mensajero para interceptar el cargamento de Akil.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Nagur_08_01"); //Ese tipo será castigado con justicia. Lo pondré entre rejas ahora mismo.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Nagur_08_02"); //Ten, toma la recompensa que te corresponde.
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	B_StartOtherRoutine (Nagur,"PRISON");
	MIS_ThiefGuild_sucked = TRUE; 
	Nagur_Ausgeliefert = TRUE;
	B_GivePlayerXP (XP_Andre_Auslieferung);
	Info_ClearChoices (DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Canthar()
{
	//Canthar in den Knast beamen
	AI_Teleport			(Canthar,"NW_CITY_HABOUR_KASERN_RENGARU"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Canthar_15_00"); //¡El mercader Canthar intenta librarse de Sarah!
	AI_Output (self, other, "DIA_Andre_Auslieferung_Canthar_08_01"); //¿Sarah? ¿La vendedora de armas del mercado?
	AI_Output (other,self , "DIA_Andre_Auslieferung_Canthar_15_02"); //Se suponía que yo debía endilgarle a Sarah una carta falsa en la que afirmaba suministrar armas a Onar.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Canthar_08_03"); //Entiendo. Pagaré de buen grado la recompensa por ese cerdo. Prácticamente ya está entre rejas.
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	
	B_StartOtherRoutine (Canthar,"KNAST"); 
	
	MIS_Canthars_KomproBrief  = LOG_FAILED;
	B_CheckLog ();
	
	Canthar_Ausgeliefert = TRUE;
	B_GivePlayerXP (XP_Andre_Auslieferung);
	
	Info_ClearChoices (DIA_Andre_Auslieferung);
};
func void DIA_Andre_Auslieferung_Sarah()
{
	//Sarah in den Knast beamen
	AI_Teleport			(Sarah,"NW_CITY_HABOUR_KASERN_RENGARU"); 
	//Canthar zum markt beamen
	AI_Teleport			(Canthar,"NW_CITY_SARAH"); 
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Sarah_15_00"); //Sarah le vende armas a Onar.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Sarah_08_01"); //¿Sarah? ¿La vendedora de armas del mercado? ¿Tienes pruebas?
	AI_Output (other, self, "DIA_Andre_Auslieferung_Sarah_15_02"); //En su bolsillo hay una carta que detalla la entrega de armas al hacendado.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Sarah_08_03"); //Esto no va a quedar así. Haré que la detengan.
	
	B_GiveInvItems (self, other, itmi_gold, Kopfgeld);
	
	B_StartOtherRoutine (Sarah,"KNAST"); 
	
	B_StartOtherRoutine (Canthar,"MARKTSTAND"); 
	
	Sarah_Ausgeliefert = TRUE;
	
	MIS_Canthars_KomproBrief  = LOG_SUCCESS;
	B_GivePlayerXP (XP_Andre_Auslieferung);
	
	Info_ClearChoices (DIA_Andre_Auslieferung);
};

// *********************************************************
//					Diebesgilde Running
// *********************************************************
	
instance DIA_Andre_DGRunning (C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	4;
	condition	 = 	DIA_Andre_DGRunning_Condition;
	information	 = 	DIA_Andre_DGRunning_Info;
	permanent    =  TRUE;
	description	 = 	"Con respecto al gremio de ladrones...";
};

func int DIA_Andre_DGRunning_Condition ()
{	
	if (MIS_Andre_GuildOfThieves == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Andre_DGRunning_Info ()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_15_00"); //Con respecto al gremio de ladrones...
	
	if (Andre_Diebesgilde_aufgeraeumt == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_08_01"); //Olvídate del asunto. He mandado a unos cuantos hombres a las alcantarillas.
		AI_Output (self, other, "DIA_Andre_DGRunning_08_02"); //El gremio de ladrones ya no es más que un triste capítulo en la historia de la ciudad.
		MIS_Andre_GuildOfThieves = LOG_OBSOLETE;
		
		if (MIS_CassiaKelche == LOG_RUNNING)
		{
			MIS_CassiaKelche = LOG_OBSOLETE;
		};
		if (MIS_RamirezSextant == LOG_RUNNING)
		{
			MIS_RamirezSextant = LOG_OBSOLETE;
		};
		return;
	};
	
	AI_Output (self, other, "DIA_Andre_DGRunning_08_03"); //¿Sí?
	
	Info_ClearChoices(DIA_Andre_DGRunning);
	Info_AddChoice(DIA_Andre_DGRunning, "Estoy en ello...", DIA_Andre_DGRunning_BACK);
	
	if (Npc_IsDead(Cassia))
	&& (Npc_IsDead(Jesper))
	&& (Npc_IsDead(Ramirez))
	{
		Info_AddChoice(DIA_Andre_DGRunning, "¡Los he capturado a todos!", DIA_Andre_DGRunning_Success);
	};
	
	if ( (Cassia.aivar[AIV_TalkedToPlayer] == TRUE) || (Jesper.aivar[AIV_TalkedToPlayer] == TRUE) || (Ramirez.aivar[AIV_TalkedToPlayer] == TRUE) )
	&& (Diebesgilde_verraten == FALSE)
	{
		Info_AddChoice(DIA_Andre_DGRunning, "¡He encontrado la guarida del gremio de ladrones!", DIA_Andre_DGRunning_Verrat);
	};
};

func void DIA_Andre_DGRunning_BACK()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_BACK_15_00"); //Estoy en ello...
	if (Diebesgilde_verraten == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_BACK_08_01"); //Muy bien. Te daré algo más de tiempo para cumplir tu misión.
	}
	else
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_BACK_08_02"); //¡Bien! Mantenme informado.
	};
	Info_ClearChoices(DIA_Andre_DGRunning);
};

func void DIA_Andre_DGRunning_Verrat()
{	
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_00"); //¡He encontrado la guarida del gremio de ladrones!
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_01"); //¿Dónde?
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_02"); //En las cloacas de la ciudad.
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_03"); //¿Qué? Hemos precintado las cloacas...
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_04"); //Parece que eso no les ha impedido salir de ahí abajo.
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_05"); //¿Has capturado a los delincuentes?
	Diebesgilde_verraten = TRUE;
	DG_gefunden = TRUE;
};

func void DIA_Andre_DGRunning_Success()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_Success_15_00"); //¡Los he capturado a todos!
	AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_01"); //Has hecho un gran servicio a la ciudad.
	DG_gefunden = TRUE;
	MIS_Andre_GuildOfThieves = LOG_SUCCESS;
	B_GivePlayerXP (XP_GuildOfThievesPlatt);
	
	if (MIS_CassiaKelche == LOG_RUNNING)
	{
		MIS_CassiaKelche = LOG_OBSOLETE;
	};
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_02"); //Si te sigue interesando un puesto en la milicia, dímelo.
	}
	else if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_03"); //Has cumplido con tu deber, como corresponde a un siervo de Innos y a un soldado del rey.
	};
	
	AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_04"); //Tienes derecho a la recompensa por los bandidos. Ten, toma.
	B_GiveInvItems (self, other, itmi_gold, (Kopfgeld*3));
	
	Info_ClearChoices(DIA_Andre_DGRunning);
};
	
// *********************************************************
//						JOIN Miliz			
// *********************************************************
instance DIA_Andre_JOIN	(C_INFO) 
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	100;
	condition	 = 	DIA_Andre_JOIN_Condition;
	information	 = 	DIA_Andre_JOIN_Info;
	permanent    =  TRUE;
	description	 = 	"¡Estoy listo para alistarme en la milicia!";
};

func int DIA_Andre_JOIN_Condition ()
{
	if (hero.guild == GIL_NONE) 
	&& (Npc_KnowsInfo (other,  DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Andre_JOIN_Info ()
{
	AI_Output (other, self, "DIA_Andre_JOIN_15_00"); //¡Estoy listo para alistarme en la milicia!
	
	//ADDON
	if (Andre_Knows_MartinEmpfehlung == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Andre_JOIN_08_00"); //Martin, el maestro de provisiones, responde por ti e incluso te ha recomendado. Eso es suficiente para mí.
	}
	//ADDON
	else if (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
	&& (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_01"); //Cumpliré mi parte del acuerdo y te admitiré en la milicia, aunque no seas ciudadano.
		AI_Output (self, other, "DIA_Andre_JOIN_08_02"); //¡Pero no le des mucho bombo! Cuantas menos personas se enteren de esta excepción, menos me tendré que justificar más adelante.
	}
	else if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_03"); //Entonces, ¿eres ciudadano de Khorinis?
		
		if (Player_IsApprentice == APP_Harad)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_04"); //El herrero me ha tomado como aprendiz.
			AI_Output (self, other, "DIA_Andre_JOIN_08_05"); //¿Harad? Lo conozco. Trabaja para nosotros, y es una buena persona.
		};
		
		if (Player_IsApprentice == APP_Constantino)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_06"); //¡Soy el aprendiz del alquimista!
			AI_Output (self, other, "DIA_Andre_JOIN_08_07"); //No es que tengamos muchos eruditos en la milicia. Es posible que tus aptitudes nos vengan muy bien.
			AI_Output (self, other, "DIA_Andre_JOIN_08_08"); //No sé gran cosa del alquimista, pero la gente dice que es un hombre honrado.
		};
		
		if (Player_IsApprentice == APP_Bosper)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_09"); //Bosper, el fabricante de arcos, me ha tomado como aprendiz.
			AI_Output (self, other, "DIA_Andre_JOIN_08_10"); //Entonces también sabrás sobrevivir al aire libre, ¿no? Eso está bien, porque la milicia no solo tiene que cumplir misiones dentro de la ciudad.
			AI_Output (self, other, "DIA_Andre_JOIN_08_11"); //Nos viene bien la gente que se sabe mover en exteriores.
			AI_Output (self, other, "DIA_Andre_JOIN_08_12"); //Y el fabricante de arcos es un hombre importante en la ciudad.
		};
		
		AI_Output (self, other, "DIA_Andre_JOIN_08_13"); //Si responde de ti, no hay nada que te impida ser admitido en la milicia.
		
		// ------- Außerdem noch GuildOfThieves ------
		if (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Andre_JOIN_08_14"); //Además, has conseguido librarnos del gremio de dragones. Solo por eso ya te habría aceptado.
		};
	}
	else //Player_IsApprentice == APP_NONE
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_15"); //Puede que así sea, pero aún no eres ciudadano y tengo órdenes.
		return;
	};
		
	AI_Output (self, other, "DIA_Andre_JOIN_08_16"); //Puedes alistarte si quieres, pero tu decisión será definitiva.
	AI_Output (self, other, "DIA_Andre_JOIN_08_17"); //Si te pones la armadura de la milicia, no te la podrás quitar y abandonar nuestras filas.
	AI_Output (self, other, "DIA_Andre_JOIN_08_18"); //¿Estás preparado para luchar a nuestro lado por Innos y por el rey?
	
	Info_ClearChoices (DIA_Andre_JOIN);
	Info_AddChoice (DIA_Andre_JOIN,"Todavía no estoy del todo seguro...",DIA_Andre_JOIN_No);
	Info_AddChoice (DIA_Andre_JOIN,"¡Estoy listo!",DIA_Andre_JOIN_Yes);
};
	
func void DIA_Andre_JOIN_Yes()
{
	AI_Output (other, self, "DIA_Andre_JOIN_Yes_15_00"); //¡Estoy listo!
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_01"); //Entonces, que así sea. Bienvenido a la milicia.
	
	Npc_SetTrueGuild (other, GIL_MIL);
	other.guild	= GIL_MIL;
	Snd_Play ("LEVELUP");
	
	Npc_ExchangeRoutine (Lothar, "START");
	
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_02"); //Aquí tienes tu armadura.
	B_GiveInvItems (self,other, ITAR_MIL_L,1);
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_03"); //Llévala con dignidad y orgullo.
	
	SLD_Aufnahme = LOG_OBSOLETE;
	KDF_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_SUCCESS;
	B_GivePlayerXP (XP_BecomeMiliz);
	
	Info_ClearChoices (DIA_Andre_JOIN);
};

func void DIA_Andre_JOIN_No()
{
	AI_Output (other, self, "DIA_Andre_JOIN_No_15_00"); //Todavía no estoy del todo seguro...
	AI_Output (self, other, "DIA_Andre_JOIN_No_08_01"); //Mientras albergues dudas acerca de tu decisión, no puedo aceptarte en la milicia.
	
	Info_ClearChoices (DIA_Andre_JOIN);
};
	
// *********************************************************
//					Endlich zu Lord Hagen?
// *********************************************************

instance DIA_Andre_LORDHAGEN		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_LORDHAGEN_Condition;
	information	 = 	DIA_Andre_LORDHAGEN_Info;
	permanent	 = 	FALSE;
	description	 = 	"¿Puedo ver a lord Hagen de una vez?";
};
func int DIA_Andre_LORDHAGEN_Condition ()
{	
	if (other.guild == GIL_MIL)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Andre_LORDHAGEN_Info ()
{
	AI_Output (other, self, "DIA_Andre_LORDHAGEN_15_00"); //¿Puedo ver a lord Hagen de una vez?
	AI_Output (self, other, "DIA_Andre_LORDHAGEN_08_01"); //Ahora estás al servicio de los paladines, y te dejarán pasar. No obstante, será mejor que tengas algo importante que decir.
	AI_Output (other, self, "DIA_Andre_LORDHAGEN_15_02"); //No te preocupes, así es...
	AI_Output (self, other, "DIA_Andre_LORDHAGEN_08_03"); //Recuerda que vas a ver al jefe de los paladines, y que tienes que comportarte adecuadamente. Ya no te representas únicamente a ti, sino también a toda la milicia.
};
// *********************************************************
//				Waffe
// *********************************************************
instance DIA_Andre_Waffe		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_Waffe_Condition;
	information	 = 	DIA_Andre_Waffe_Info;
	permanent	 = 	FALSE;
	description	 = 	"¿También me vais a dar un arma?";
};
func int DIA_Andre_Waffe_Condition ()
{	
	if (other.guild == GIL_MIL)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Andre_Waffe_Info ()
{
	AI_Output (other, self, "DIA_Andre_Waffe_15_00"); //¿También me vais a dar un arma?
	AI_Output (self, other, "DIA_Andre_Waffe_08_01"); //Claro. Peck es el que suele ocuparse, pero ahora caigo en que llevo un tiempo sin verle.
	AI_Output (self, other, "DIA_Andre_Waffe_08_02"); //Averigua dónde se esconde y tráelo. Después de eso te dará un arma.
	AI_Output (self, other, "DIA_Andre_Waffe_08_03"); //Y si quieres dormir, túmbate en una de las camas del barracón.
	
	MIS_Andre_Peck = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Peck,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Peck,LOG_RUNNING);
	B_LogEntry (TOPIC_Peck,"Peck está en la ciudad, en algún lugar. Si le llevo de vuelta al cuartel, puedo conseguir que me dé un arma.");
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info FOUND_PECK
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_FOUND_PECK		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_FOUND_PECK_Condition;
	information	 = 	DIA_Andre_FOUND_PECK_Info;
	permanent	 =  FALSE;
	description	 = 	"He conseguido localizar a Peck.";
};

func int DIA_Andre_FOUND_PECK_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Peck_FOUND_PECK)
	&& (MIS_Andre_Peck == LOG_RUNNING)
	&& (Npc_IsDead (Peck) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Andre_FOUND_PECK_Info ()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_15_00"); //He conseguido localizar a Peck.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_08_01"); //Sí, ya ha vuelto a su puesto y a sus obligaciones. ¿Dónde lo encontraste?

	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
	Info_AddChoice 		(DIA_Andre_FOUND_PECK,"Se cruzó en mi camino...",DIA_Andre_FOUND_PECK_SOMEWHERE);
	Info_AddChoice 		(DIA_Andre_FOUND_PECK,"En 'La antorcha roja'…",DIA_Andre_FOUND_PECK_REDLIGHT);

};
FUNC VOID DIA_Andre_FOUND_PECK_SOMEWHERE()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_SOMEWHERE_15_00"); //Se cruzó conmigo en la ciudad.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_SOMEWHERE_08_01"); //De acuerdo. Ve a verle y dile que te dé un arma.
	
	MIS_Andre_Peck = LOG_OBSOLETE;// wird hier benutzt, um Unterscheidung bei Waffenausgabe zu haben, aber Mission ist trotzdem geschafft! M.F.
	B_GivePlayerXP 		(XP_FoundPeck);
	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
};
FUNC VOID DIA_Andre_FOUND_PECK_REDLIGHT()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_REDLIGHT_15_00"); //Estaba en ''La antorcha roja''.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_REDLIGHT_08_01"); //Así que andaba con las chicas en lugar de cumplir con su deber.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_REDLIGHT_08_02"); //Voy a tener unas palabritas con él.
	
	B_GivePlayerXP 		(XP_FoundPeck*2);
	MIS_Andre_Peck = LOG_SUCCESS;
	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
};




// ################################################
// ###											###
// 				_NACH_  MILIZ-AUFNAHME
// ###											###
// ################################################

FUNC VOID B_AndreSold ()
{
	AI_Output (self, other,"DIA_Andre_Sold_08_00");//Aquí tienes la paga.
	B_GiveInvItems (self, other, itmi_Gold, Andre_Sold); 
};

///////////////////////////////////////////////////////////////////////
//	Info 
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_FIRSTMISSION		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_FIRSTMISSION_Condition;
	information	 = 	DIA_Andre_FIRSTMISSION_Info;
	permanent 	 =  FALSE; 
	description	 = 	"¿Tienes una misión para mí?";
};
func int DIA_Andre_FIRSTMISSION_Condition ()
{
	if (other.guild == GIL_MIL)
	{
		return TRUE;
	};
};
func void DIA_Andre_FIRSTMISSION_Info ()
{
	AI_Output (other, self, "DIA_Andre_FIRSTMISSION_15_00"); //¿Vas a encargarme alguna misión?
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_01"); //En los últimos tiempos cada vez se vende más hierba del pantano en la ciudad.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_02"); //No podemos permitir que se ponga de moda.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_03"); //De lo contrario, todo el mundo empezará a fumar y no serán capaces de trabajar, mucho menos de blandir un arma.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_04"); //Sobre todo ahora que corremos el riesgo de que nos ataquen los orcos o los mercenarios.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_05"); //Sospecho que los mercenarios están detrás de todo esto. Apuesto a que son ellos los que introducen la hierba en la ciudad.
	AI_Output (other, self, "DIA_Andre_FIRSTMISSION_15_06"); //¿Qué hay que hacer?
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_07"); //Mortis, uno de nuestros hombres, escuchó en la taberna del puerto que ha llegado un paquete de hierba del pantano a algún lugar del distrito portuario.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_08"); //Echa un vistazo por allí y tráeme el paquete.
	
	MIS_ANDRE_WAREHOUSE = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_WAREHOUSE,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_WAREHOUSE,LOG_RUNNING);
	B_LogEntry (TOPIC_WAREHOUSE,"Ha llegado al puerto un cargamento de hierba del pantano. Mortis se enteró en una taberna de por aquí. Tengo que encontrar el cargamento y llevárselo a lord Andre.");
	
	
};
///////////////////////////////////////////////////////////////////////
//	Info FOUND_STUFF
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_FOUND_STUFF		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_FOUND_STUFF_Condition;
	information	 = 	DIA_Andre_FOUND_STUFF_Info;
	permanent	 =  TRUE;
	description	 = 	"Con respecto al paquete...";
};
func int DIA_Andre_FOUND_STUFF_Condition ()
{	
	if (MIS_ANDRE_WAREHOUSE == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Andre_FOUND_STUFF_Info ()
{
	
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_15_00"); //Con respecto al paquete...
	AI_Output (self, other, "DIA_Andre_FOUND_STUFF_08_01"); //¿Lo has encontrado?
	
	if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
	|| (MIS_Cipher_Paket == LOG_SUCCESS)
	{
		Info_ClearChoices (DIA_Andre_FOUND_STUFF);
	
		if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
		{
			Info_AddChoice (DIA_Andre_FOUND_STUFF,"Sí, aquí está.",DIA_Andre_FOUND_STUFF_Ja);	
		};
		
		Info_AddChoice (DIA_Andre_FOUND_STUFF,"Lo tiré a la ensenada.",DIA_Andre_FOUND_STUFF_Becken);
	}
	else
	{
		AI_Output	(other, self, "DIA_Andre_FOUND_STUFF_15_02"); //Por ahora, no.
	};
};
FUNC VOID DIA_Andre_FOUND_STUFF_Ja()
{
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_Ja_15_00"); //Sí, aquí está.
	B_GiveInvItems (other, self,ItMi_HerbPaket,1);
	AI_Output	(self, other, "DIA_Andre_FOUND_STUFF_Ja_08_01"); //Buen trabajo. Pondremos la hierba a buen recaudo.
	B_AndreSold ();
	
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	MIS_Cipher_Paket = LOG_FAILED;
	B_GivePlayerXP (XP_Warehouse_Super*2);
	Info_ClearChoices 	(DIA_Andre_FOUND_STUFF);
	
};
FUNC VOID DIA_Andre_FOUND_STUFF_Becken()
{
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_Becken_15_00"); //Lo tiré a la ensenada.
	AI_Output (self, other, "DIA_Andre_FOUND_STUFF_Becken_08_01"); //¿Ah, sí? Bueno, lo importante es que ya no va a caer en malas manos.
	B_AndreSold ();
	
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	B_GivePlayerXP (XP_Warehouse_Super);
	Info_ClearChoices 	(DIA_Andre_FOUND_STUFF);
};	
	

///////////////////////////////////////////////////////////////////////
//	Info FIND_DEALER
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_FIND_DEALER		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_FIND_DEALER_Condition;
	information	 = 	DIA_Andre_FIND_DEALER_Info;
	permanent	 =  FALSE;
	description	 = 	"¿Tienes algún otro trabajo para mí?";
};

func int DIA_Andre_FIND_DEALER_Condition ()
{	
	if (MIS_ANDRE_WAREHOUSE == LOG_SUCCESS)
	&& (Npc_IsDead (Borka)== FALSE)
	{
		return TRUE;
	};
};
func void DIA_Andre_FIND_DEALER_Info ()
{
	AI_Output (other, self, "DIA_Andre_FIND_DEALER_15_00"); //¿Tienes algún otro trabajo para mí?
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_01"); //Has retirado de la circulación el paquete de hierba del pantano. Muy bien.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_02"); //Pero me gustaría saber quién la está distribuyendo entre la gente.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_03"); //Debe de ser alguien del distrito portuario.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_04"); //Si alguien viniera regularmente desde fuera de la ciudad, le habríamos atrapado hace tiempo.
	AI_Output (other, self, "DIA_Andre_FIND_DEALER_15_05"); //¿Qué es exactamente lo que tengo que hacer?
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_06"); //Encuentra al traficante y consigue que te venda algo de hierba. No va a ser sencillo, pero si no lo haces no podremos detenerlo.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_07"); //Habla con Mortis. Conoce el distrito portuario y quizá pueda echarte una mano.
	
	
	MIS_Andre_REDLIGHT = LOG_RUNNING;
	B_StartOtherRoutine (Nadja, "SMOKE");
	
	Log_CreateTopic (TOPIC_REDLIGHT,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_REDLIGHT,LOG_RUNNING);
	B_LogEntry (TOPIC_REDLIGHT,"Tengo que encontrar al tipo que está vendiendo hierba del pantano en el distrito del puerto. Tengo que hacerlo para que me venda algo, Mortis puede ayudarme con eso.");
};
///////////////////////////////////////////////////////////////////////
//	Info REDLIGHT_SUCCESS
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_REDLIGHT_SUCCESS		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 = 	2;
	condition	 = 	DIA_Andre_REDLIGHT_SUCCESS_Condition;
	information	 = 	DIA_Andre_REDLIGHT_SUCCESS_Info;
	permanent	 =  TRUE;
	description	 = 	"Con respecto a la hierba...";
};
func int DIA_Andre_REDLIGHT_SUCCESS_Condition ()
{
	if  (MIS_Andre_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Andre_REDLIGHT_SUCCESS_Info ()
{
	AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_00"); //Con respecto a la hierba...
	
	if (Npc_IsDead (Borka) == TRUE)
	|| (Undercover_Failed == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_01"); //No creo que averigüemos nada en el distrito portuario.
		
		if  (Npc_IsDead (Borka) == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_02"); //Sobre todo desde la muerte de ese gorila.
		};
		
		if (Nadja_Victim == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_03"); //Nadja, la chica de la Antorcha roja, ha muerto. Tuvo que tratarse de un accidente extraño.
			B_RemoveNpc (Nadja);
		};
		if (Undercover_Failed == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_04"); //No fuiste lo bastante discreto.
		};
		MIS_Andre_REDLIGHT = LOG_FAILED;
		B_CheckLog();
	}
	else if  (Borka_Deal == 2)
	{
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_05"); //Sé quién vende la hierba en la ciudad. Es Borka, el portero de la Antorcha roja.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_06"); //¿De verdad? ¿Tienes pruebas?
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_07"); //Me vendió hierba del pantano.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_08"); //Muy bien, con eso nos basta. Haré que le detengan de inmediato.
		
		B_StartOtherRoutine (Borka, "PRISON");
		MIS_Andre_REDLIGHT = LOG_SUCCESS;
		B_GivePlayerXP (XP_Redlight);
		B_AndreSold ();
	}
	else 
	{
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_09"); //… sigo en ello.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_10"); //Bueno, recuerda que debes hacer que el tipo cierre un trato contigo.
	};
};
///////////////////////////////////////////////////////////////////////
//	Info HilfBauerLobart
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_HILFBAUERLOBART		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr			 =  3;
	condition	 = 	DIA_Andre_HILFBAUERLOBART_Condition;
	information	 = 	DIA_Andre_HILFBAUERLOBART_Info;
	description	 = 	"¿Tienes otra misión para mí?";
};
func int DIA_Andre_HILFBAUERLOBART_Condition ()
{	
	if (MIS_ANDRE_WAREHOUSE == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Andre_HILFBAUERLOBART_Info ()
{
	AI_Output (other, self, "DIA_Andre_HILFBAUERLOBART_15_00"); //¿Tienes otra misión para mí?
	AI_Output (self, other, "DIA_Andre_HILFBAUERLOBART_08_01"); //Lobart, el plantador de nabos, tiene problemas en sus tierras.
	AI_Output (self, other, "DIA_Andre_HILFBAUERLOBART_08_02"); //Si le ayudamos, su relación con la ciudad se reforzará. Ve a ver qué pasa.

	
	Log_CreateTopic (TOPIC_Feldraeuber, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Feldraeuber, LOG_RUNNING);
	B_LogEntry (TOPIC_Feldraeuber,"Andre me ha enviado a la granja de Lobart. Tengo que ayudar a que Lobart vuelva a poner en orden su granja."); 
	
	
	MIS_AndreHelpLobart = LOG_RUNNING;

	Wld_InsertNpc		(Lobarts_Giant_Bug1, 			"NW_FARM1_FIELD_06"); 
	Wld_InsertNpc		(Lobarts_Giant_Bug2, 			"NW_FARM1_FIELD_06");
	
	Wld_InsertNpc		(Lobarts_Giant_Bug3, 			"NW_FARM1_FIELD_05"); 
	Wld_InsertNpc		(Lobarts_Giant_Bug4, 			"NW_FARM1_FIELD_05"); 

	Wld_InsertNpc		(Lobarts_Giant_Bug5, 			"NW_FARM1_FIELD_04"); 
	Wld_InsertNpc		(Lobarts_Giant_Bug6, 			"NW_FARM1_FIELD_04"); 

	Wld_InsertNpc		(Lobarts_Giant_Bug7, 			"NW_FARM1_FIELD_03"); 
	
	
	B_StartOtherRoutine (Vino,"BUGSTHERE");
	B_StartOtherRoutine (LobartsBauer1,"BUGSTHERE");
	B_StartOtherRoutine (LobartsBauer2,"BUGSTHERE");
	
	AI_StopProcessInfos (self);	
};

///////////////////////////////////////////////////////////////////////
//	Info LOBART_SUCCESS
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_LOBART_SUCCESS		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_LOBART_SUCCESS_Condition;
	information	 = 	DIA_Andre_LOBART_SUCCESS_Info;
	description	 = 	"He ayudado a Lobart.";
};
func int DIA_Andre_LOBART_SUCCESS_Condition ()
{	
	if (MIS_AndreHelpLobart == LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Andre_LOBART_SUCCESS_Info ()
{
	AI_Output (other, self, "DIA_Andre_LOBART_SUCCESS_15_00"); //He ayudado a Lobart.
	AI_Output (self, other, "DIA_Andre_LOBART_SUCCESS_08_01"); //Magnífico. Si Lobart está contento, seguirá vendiendo sus nabos a la ciudad.
	B_GivePlayerXP (XP_LobartBugs);
	B_AndreSold ();
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_MissingPeople		(C_INFO)
{
	npc		 	= Mil_311_Andre;
	nr		 	= 5;
	condition	= DIA_Addon_Andre_MissingPeople_Condition;
	information	= DIA_Addon_Andre_MissingPeople_Info;

	description	= "¿Qué hay de los desaparecidos?";
};
func int DIA_Addon_Andre_MissingPeople_Condition ()
{
	if (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	&& (other.guild == GIL_MIL)
	{
		return TRUE;
	};
};
func void DIA_Addon_Andre_MissingPeople_Info ()
{
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople_15_00"); //¿Qué hay de los desaparecidos?
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_01"); //¿Qué pasa con ellos?
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople_15_02"); //¿No deberíamos ir a buscarles?
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_03"); //Lord Hagen me ha dado órdenes de proteger la ciudad y las granjas de alrededor.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_04"); //Eso significa que tenemos que cuidar a los que siguen AQUÍ.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_05"); //La milicia patrulla las calles de noche. Es todo lo que puedo hacer.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_06"); //TÚ serás quien se ocupe de lo que yo te encargue, ¿entendido?
	
	MIS_Addon_Andre_MissingPeople = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_MissingPeople2	(C_INFO)
{
	npc		 	= Mil_311_Andre;
	nr		 	= 5;
	condition	= DIA_Addon_Andre_MissingPeople2_Condition;
	information	= DIA_Addon_Andre_MissingPeople2_Info;

	description	= "Sobre la gente desaparecida…";
};
func int DIA_Addon_Andre_MissingPeople2_Condition ()
{
	if (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	&& (other.guild != GIL_MIL)
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Andre_MissingPeople2_Info ()
{
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople2_15_00"); //Sobre la gente desaparecida
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople2_08_01"); //Déjame en paz con ESO. Tengo otros problemas.
	MIS_Addon_Andre_MissingPeople = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info ReturnedMissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_ReturnedMissingPeople		(C_INFO)
{
	npc		 = 	Mil_311_Andre;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Andre_ReturnedMissingPeople_Condition;
	information	 = 	DIA_Addon_Andre_ReturnedMissingPeople_Info;

	description	 = 	"He rescatado a algunos de los desaparecidos.";
};

func int DIA_Addon_Andre_ReturnedMissingPeople_Condition ()
{
	if (MissingPeopleReturnedHome == TRUE)
	&& (MIS_Addon_Andre_MissingPeople == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_ReturnedMissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_00"); //He conseguido rescatar a algunos de los desaparecidos.
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_01"); //¡Y yo aquí, preguntándome dónde demonios te habías metido?
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_02"); //¡Formas parte de la milicia! ¡No recibiste órdenes de rescatar a nadie!
		AI_Output (other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_03"); //Pero
	};	
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_04"); //¿A cuánta gente has encontrado?
	AI_Output (other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_05"); //A todos los que seguían con vida
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_06"); //¿Todos?... Esto
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_07"); //¡Estoy orgulloso de ti! Y me alegro de haberte dejado alistarte.
		B_AndreSold ();
	};
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_08"); //Una hazaña magnífica.

	MIS_Addon_Andre_MissingPeople = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Andre_MissingPeople);
};



//##########################################
//##
//##	Kapitel 3
//##
//##########################################


func void B_Andre_GotoLordHagen()
{
	AI_Output (self ,other,"DIA_Andre_Add_08_11"); //Será mejor que vayas directamente a verle.
};

// *********************************************************
// 						BerichtDrachen
// *********************************************************

instance DIA_Andre_BerichtDrachen		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr 			= 1;
	condition	 = 	DIA_Andre_BerichtDrachen_Condition;
	information	 = 	DIA_Andre_BerichtDrachen_Info;
	permanent	 =	FALSE;
	description	 = 	"¡Estuve en el Valle de las Minas y vi a los dragones!";
};
func int DIA_Andre_BerichtDrachen_Condition ()
{	
	if (EnterOW_Kapitel2 == TRUE)
	&& (MIS_OLDWORLD != LOG_SUCCESS)
	{
		return TRUE;
	};
};
func void DIA_Andre_BerichtDrachen_Info ()
{
	//AI_Output (other, self,"DIA_Andre_Add_15_12"); //Lord Hagen hat mich auf eine Mission ins Minental geschickt! Ich soll direkt aufbrechen.
	
	AI_Output (other, self,"DIA_Andre_Add_15_13"); //¡Estuve en el Valle de las Minas y vi a los dragones!
	if (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) > 0)
	{
		AI_Output (other, self,"DIA_Andre_Add_15_14"); //Tengo una carta del comandante Garond que confirma todo lo que he dicho.
	};
	AI_Output (self ,other,"DIA_Andre_Add_08_10"); //¡Eso va a interesarle a lord Hagen!
	B_Andre_GotoLordHagen();
};

///////////////////////////////////////////////////////////////////////
//		Cornelius lügt
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_BennetInPrison		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_BennetInPrison_Condition;
	information	 = 	DIA_Andre_BennetInPrison_Info;
	permanent	 =	TRUE;
	description	 = 	"¿Qué hay de Bennet, el herrero?";
};
func int DIA_Andre_BennetInPrison_Condition ()
{	
	if (MIS_RescueBennet == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Andre_BennetInPrison_Info ()
{
	AI_Output (other, self, "DIA_Andre_BennetInPrison_15_00"); //¿Qué hay de Bennet, el herrero?
	AI_Output (self, other, "DIA_Andre_BennetInPrison_08_01"); //¿Te refieres al mercenario? Está en la cárcel, y ése es su lugar.
	AI_Output (other,self ,"DIA_Andre_BennetInPrison_Talk_15_00"); //¿Puedo hablar con él?
	AI_Output (self ,other,"DIA_Andre_BennetInPrison_Talk_08_01"); //Por supuesto, entra. Pero si intentas ayudarle a huir, te vas a enterar.
};

///////////////////////////////////////////////////////////////////////
//		Cornelius lügt
///////////////////////////////////////////////////////////////////////

instance DIA_Andre_Cornelius_Liar		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_Cornelius_Liar_Condition;
	information	 = 	DIA_Andre_Cornelius_Liar_Info;
	permanent	 =	TRUE;
	description	 = 	"Creo que Cornelius miente.";
};
func int DIA_Andre_Cornelius_Liar_Condition ()
{	
	if (Cornelius_ThreatenByMilSC == TRUE)
	&& (CorneliusFlee != TRUE)
	{
		return TRUE;
	};
};
func void DIA_Andre_Cornelius_Liar_Info ()
{
	AI_Output			(other, self, "DIA_Andre_Cornelius_Liar_15_00"); //Creo que Cornelius miente.
	AI_Output			(self, other, "DIA_Andre_Cornelius_Liar_08_01"); //¿Estás seguro?
	
	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
	Info_AddChoice (DIA_Andre_Cornelius_Liar,"No.",DIA_Andre_Cornelius_Liar_No);  
	Info_AddChoice (DIA_Andre_Cornelius_Liar,"Sí.",DIA_Andre_Cornelius_Liar_Yes);
};

FUNC VOID DIA_Andre_Cornelius_Liar_No()
{
	AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_No_15_00"); //No.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_01"); //Entonces no deberías anunciar en voz alta tus sospechas.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_02"); //Cornelius es un hombre influyente. Si se empeña, te puede hacer la vida imposible.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_03"); //Si no tienes pruebas, no puedo ayudarte.

	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
};

FUNC VOID DIA_Andre_Cornelius_Liar_Yes()
{
	AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_00"); //Sí.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_01"); //¿Qué pruebas tienes?
	
	if (Cornelius_IsLiar == TRUE)
	{
		AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_02"); //¡He leído su diario! Le sobornaron. Todo no era más que un hatajo de mentiras.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_03"); //Si es así, debes ir a ver de inmediato a lord Hagen.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_04"); //Enséñale el diario. Él se ocupará del resto.
	}
	else
	{
		AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_05"); //Esto... bueno... creo que...
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_06"); //Necesito pruebas, no suposiciones. Consigue las pruebas y te echaré una mano.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_07"); //Hasta entonces, piénsate bien lo que dices.
	};
	
	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
};

// ******************************************************
//						Als Paladin
// ******************************************************

instance DIA_Andre_Paladin		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	condition	 = 	DIA_Andre_Paladin_Condition;
	information	 = 	DIA_Andre_Paladin_Info;
	permanent	 =	FALSE;
	important	 = 	TRUE;
};
func int DIA_Andre_Paladin_Condition ()
{	
	if (other.guild == GIL_PAL)
	{
		return TRUE;
	};
};
func void DIA_Andre_Paladin_Info ()
{
	AI_Output (self, other, "DIA_Andre_Paladin_08_00"); //¡Ya eres paladín! ¡Enhorabuena!
	AI_Output (self, other, "DIA_Andre_Paladin_08_01"); //Desde el principio pensé que no durarías mucho en la milicia.
};

// ******************************************************
//						PERM
// ******************************************************

instance DIA_Andre_PERM		(C_INFO)
{
	npc			 = Mil_311_Andre;
	nr 			 = 100;
	condition	 = DIA_Andre_PERM_Condition;
	information	 = DIA_Andre_PERM_Info;
	permanent	 = TRUE;
	description	 = "¿Cómo están las cosas en la ciudad?";
};
func int DIA_Andre_PERM_Condition ()
{	
	if (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};
func void DIA_Andre_PERM_Info ()
{
	AI_Output (other, self, "DIA_Andre_PERM_15_00"); //¿Cómo están las cosas en la ciudad?
	
	AI_Output (self, other, "DIA_Andre_PERM_08_01"); //Todo está bajo control.
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Andre_PERM_08_02"); //Cumple con tus obligaciones.
	};
	
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Andre_PERM_08_03"); //A partir de ahora, te presentarás directamente ante lord Hagen. Ve a hablar con él.
	};
};


// ###################
//		  Kap 5
// ###################

// *********************************************************
// 						BerichtDrachenTot
// *********************************************************

instance DIA_Andre_BerichtDrachenTot		(C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr 			= 1;
	condition	 = 	DIA_Andre_BerichtDrachenTot_Condition;
	information	 = 	DIA_Andre_BerichtDrachenTot_Info;
	permanent	 =	FALSE;
	description	 = 	"¡He matado todos los dragones del Valle de las Minas!";
};
func int DIA_Andre_BerichtDrachenTot_Condition ()
{	
	if (Kapitel == 5)
	{
		return TRUE;
	};
};
func void DIA_Andre_BerichtDrachenTot_Info ()
{
	AI_Output (other, self,"DIA_Andre_Add_15_15"); //¡He matado todos los dragones del Valle de las Minas!
	AI_Output (self ,other,"DIA_Andre_Add_08_08"); //Si eso es cierto, tenemos que informar a lord Hagen.
	B_Andre_GotoLordHagen();
};

// *********************************************************
// 						BerichtTorAuf
// *********************************************************

instance DIA_Andre_BerichtTorAuf (C_INFO)
{
	npc			 = 	Mil_311_Andre;
	nr 			= 1;
	condition	 = 	DIA_Andre_BerichtTorAuf_Condition;
	information	 = 	DIA_Andre_BerichtTorAuf_Info;
	permanent	 =	FALSE;
	description	 = 	"¡Los orcos han tomado al asalto el castillo del Valle de las Minas!";
};
func int DIA_Andre_BerichtTorAuf_Condition ()
{	
	if (Kapitel == 5)
	&& (MIS_OCGateOpen == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Andre_BerichtDrachenTot))
	{
		return TRUE;
	};
};
func void DIA_Andre_BerichtTorAuf_Info ()
{
	AI_Output (other, self,"DIA_Andre_Add_15_16"); //¡Los orcos han tomado al asalto el castillo del Valle de las Minas!
	AI_Output (self ,other,"DIA_Andre_Add_08_09"); //¡No! Lord Hagen tiene que enterarse.
	B_Andre_GotoLordHagen();
};





















