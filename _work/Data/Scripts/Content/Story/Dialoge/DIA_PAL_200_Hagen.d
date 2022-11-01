// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Hagen_EXIT(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 999;
	condition	= DIA_Hagen_EXIT_Condition;
	information	= DIA_Hagen_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Hagen_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hagen_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 					Petzmaster: Schulden offen 
// ************************************************************

// ---------------------------
var int Hagen_LastPetzCounter;
var int Hagen_LastPetzCrime;
// ---------------------------

INSTANCE DIA_Hagen_PMSchulden (C_INFO)
{
	npc         = PAL_200_Hagen;
	nr          = 1;
	condition   = DIA_Hagen_PMSchulden_Condition;
	information = DIA_Hagen_PMSchulden_Info;
	permanent   = TRUE;
	important 	= TRUE; 
};

FUNC INT DIA_Hagen_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Hagen_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Hagen_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Hagen_PMSchulden_Info()
{
	AI_Output (self, other, "DIA_Hagen_PMSchulden_04_00"); //Me alegro de que hayas venido. Ahora puedes pagar la multa.

	if (B_GetTotalPetzCounter(self) > Hagen_LastPetzCounter)
	{
		var int diff; diff = (B_GetTotalPetzCounter(self) - Hagen_LastPetzCounter);
		
		if (diff > 0)
		{
			Hagen_Schulden = Hagen_Schulden + (diff * 50);
		};
		
		if (Hagen_Schulden > 1000)	{	Hagen_Schulden = 1000;	};
		
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_01"); //No te tomas muy en serio las leyes de la ciudad, ¿verdad?
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_02"); //La lista de tus agravios ha crecido.
		if (Hagen_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_03"); //… no me digas que no lo sabías...
		}
		else
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_04"); //Pagarás la multa máxima.
			B_Say_Gold (self, other, Hagen_Schulden);
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Hagen_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_05"); //Bueno, parece que la situación ha cambiado.
		
		if (Hagen_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_06"); //¡No hay más testigos de tu asesinato!
		};
		
		if (Hagen_LastPetzCrime == CRIME_THEFT)
		|| ( (Hagen_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_07"); //¡Ahora nadie testificará que has robado!
		};
		
		if (Hagen_LastPetzCrime == CRIME_ATTACK)
		|| ( (Hagen_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_08"); //No hay más testigos de tu pelea.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_09"); //Las acusaciones contra ti ya no se mantienen.
		};
		
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_10"); //No sé que pasó en la ciudad, ni quiero saberlo.
		AI_Output (self, other, "DIA_Hagen_PMSchulden_04_11"); //Limítate a asegurarte de que no te metes en problemas aquí.
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_12"); //En cualquier caso, he decidido eximirte de tus deudas.
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_13"); //Procura no volver a meterte en más líos.
	
			Hagen_Schulden			= 0;
			Hagen_LastPetzCounter 	= 0;
			Hagen_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_14"); //Sin embargo, pagarás hasta la última moneda de las multas.
			B_Say_Gold (self, other, Hagen_Schulden);
			AI_Output (self, other, "DIA_Hagen_PMSchulden_04_15"); //Bien, ¿quieres pagar?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Hagen_PMSchulden);
		Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
		Info_AddChoice		(DIA_Hagen_PMSchulden,"¡No tengo bastante oro!",DIA_Hagen_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Hagen_PMSchulden,"¿Dime otra vez cuánto era?",DIA_Hagen_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
		{
			Info_AddChoice 	(DIA_Hagen_PMSchulden,"¡Quiero pagar la multa!",DIA_Hagen_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Hagen_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Hagen_PMSchulden_HowMuchAgain_15_00"); //¿Y cuánto era?
	B_Say_Gold (self, other, Hagen_Schulden);

	Info_ClearChoices  	(DIA_Hagen_PMSchulden);
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_AddChoice		(DIA_Hagen_PMSchulden,"¡No tengo bastante oro!",DIA_Hagen_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Hagen_PMSchulden,"¿Dime otra vez cuánto era?",DIA_Hagen_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
	{
		Info_AddChoice 	(DIA_Hagen_PMSchulden,"¡Quiero pagar la multa!",DIA_Hagen_PETZMASTER_PayNow);
	};
};

// *** weitere Choices siehe unten (DIA_Hagen_PETZMASTER) ***


// ************************************************************
// 			  			 PETZ-MASTER 
// ************************************************************

instance DIA_Hagen_PETZMASTER   (C_INFO)
{
	npc         = PAL_200_Hagen;
	nr          = 1;
	condition   = DIA_Hagen_PETZMASTER_Condition;
	information = DIA_Hagen_PETZMASTER_Info;
	permanent   = TRUE;
	important	= TRUE;
};
FUNC INT DIA_Hagen_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Hagen_LastPetzCrime)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hagen_PETZMASTER_Info()
{
	Hagen_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	// ------ SC hat mit Hagen noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_00"); //Tu reputación te precede. Has violado las leyes de la ciudad.
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_01"); //Te has metido en un buen lío.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_02"); //¡El asesinato es un crimen muy grave!
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Hagen_Schulden = Hagen_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_03"); //Por no hablar de tus otras infracciones.
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_04"); //Los guardias tienen órdenes de ejecutar de inmediato a todos los asesinos.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_05"); //En esta ciudad el asesinato es inaceptable. Pero puedes demostrar tus remordimientos pagando la multa.

	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_06"); //¡Estás acusado de robo!
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_07"); //Por no hablar del resto de las cosas que he oído.
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_08"); //Es una violación de las leyes de la ciudad. Tendrás que pagar una multa.
		
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_09"); //Te has metido en una pelea. Al hacerlo, has violado la ley.
		
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_10"); //¿Y qué era eso de una oveja?
		};
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_11"); //Una violación de las leyes de la ciudad es una violación de las leyes de Innos.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_12"); //Por lo tanto, tendrás que pagar por ello.
		
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_13"); //Has perseguido a nuestras ovejas. Al principio no quería creerlo.
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_14"); //¿Por qué debo perder el tiempo con estas insignificancias?
		AI_Output (self, other, "DIA_Hagen_PETZMASTER_04_15"); //¡Tendrás que pagar una indemnización!
		
		Hagen_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_15_16"); //¿Cuánto?
	
	if (Hagen_Schulden > 1000)	{	Hagen_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Hagen_Schulden);
	
	Info_ClearChoices  	(DIA_Hagen_PMSchulden);
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_AddChoice		(DIA_Hagen_PETZMASTER,"¡No tengo bastante oro!",DIA_Hagen_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
	{
		Info_AddChoice 	(DIA_Hagen_PETZMASTER,"¡Quiero pagar la multa!",DIA_Hagen_PETZMASTER_PayNow);
	};
};

func void DIA_Hagen_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_PayNow_15_00"); //¡Quiero pagar la multa!
	B_GiveInvItems (other, self, itmi_gold, Hagen_Schulden);
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayNow_04_01"); //¡Bien! Me encargaré de que se enteren todos en la ciudad. Hasta cierto punto, ayudará a que recuperes algo de tu reputación.

	B_GrantAbsolution (LOC_CITY);
	
	Hagen_Schulden			= 0;
	Hagen_LastPetzCounter 	= 0;
	Hagen_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Hagen_PETZMASTER);
	Info_ClearChoices  	(DIA_Hagen_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Hagen_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Hagen_PETZMASTER_PayLater_15_00"); //¡No tengo oro suficiente!
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayLater_04_01"); //Entonces tendrás que procurarte el oro lo antes posible.
	AI_Output (self, other, "DIA_Hagen_PETZMASTER_PayLater_04_02"); //Y, te lo advierto, si empeoras tus crímenes la situación también empeorará.
	
	Hagen_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Hagen_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Hallo (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Hallo_Condition;
	information	 = 	DIA_Lord_Hagen_Hallo_Info;
	important	 = 	TRUE;
	permanent	 = 	FALSE;
};
func int DIA_Lord_Hagen_Hallo_Condition ()
{	
	if (hero.guild != GIL_NONE)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_00"); //He oído hablar de ti.
	if (Npc_KnowsInfo (other, DIA_Lothar_EyeInnos))
	|| (Andre_EyeInnos == TRUE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_03"); //Lothar ha informado de que quieres hablar conmigo.
		AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_01"); //Eres el extranjero que pide el Ojo de Innos.
	};
	
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_02"); //Soy lord Hagen.
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_03"); //Paladín del rey, guerrero de nuestro señor, Innos, y comandante en jefe de Khorinis.
	AI_Output (self, other, "DIA_Lord_Hagen_Hallo_04_04"); //Tengo mucho que hacer, así que no me hagas perder el tiempo. Dime por qué estás aquí.
};

///////////////////////////////////////////////////////////////////////
//	Info Frieden
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Frieden (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Frieden_Condition;
	information	 = 	DIA_Lord_Hagen_Frieden_Info;
	permanent	 = 	FALSE;
	description	 =  "¡Traigo una oferta de paz de los mercenarios!";
};
func int DIA_Lord_Hagen_Frieden_Condition ()
{	
	if (MIS_Lee_Friedensangebot == LOG_RUNNING)
	&& (Npc_HasItems (other, itwr_Passage_MIS) > 0)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Frieden_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Frieden_15_00"); //¡Traigo una oferta de paz de los mercenarios!
	B_GiveInvItems (other, self, itwr_Passage_MIS, 1);
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_01"); //(Gruñendo) Mm, ¡muéstramela!
	B_UseFakeScroll ();
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_02"); //Conozco al general Lee. También conozco las circunstancias bajo las que le condenaron a trabajos forzados en la colonia.
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_03"); //Le considero un hombre honorable. Estoy dispuesto a indultarle, ¡solo a él!
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_04"); //Esto no se aplica a sus hombres. ¡La mayoría son asesinos sin honor que se han ganado el castigo!
	AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_05"); //Tengo claro que no les perdonaré. Infórmale de ello.
	Hagen_FriedenAbgelehnt = TRUE;
	if (!Npc_KnowsInfo (other, DIA_Lord_Hagen_Armee))
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Frieden_04_06"); //¿Eso es todo?
	};
	B_LogEntry (Topic_Frieden,"Lord Hagen está dispuesto a darle el perdón a Lee, pero no al resto de los mercenarios."); 
};

///////////////////////////////////////////////////////////////////////
//	Info Armee
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Armee (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Armee_Condition;
	information	 = 	DIA_Lord_Hagen_Armee_Info;
	permanent	 = 	FALSE;
	description	 =  "Las huestes del mal están muy cerca de aquí. En el Valle de las Minas.";
};
func int DIA_Lord_Hagen_Armee_Condition ()
{	
	if (!MIS_Lee_Friedensangebot == LOG_RUNNING)
	|| (Hagen_FriedenAbgelehnt == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Armee_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_00"); //Las huestes del mal se están reuniendo muy cerca de aquí. En el Valle de las Minas.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_01"); //¿En el Valle de las Minas? Hemos mandado allí una expedición. También hemos oído que el paso está ocupado por orcos.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_02"); //Pero hasta ahora, no sé nada de un ejército del mal.
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_Frieden))
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_03"); //¿Es esto un simple truco para convencerme de que debo aliarme con los mercenarios?
		AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_04"); //No.
	};
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_05"); //(Escéptico) ¿Y qué ejército se supone que es ése?
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_06"); //Un ejército de dragones que han movilizado huestes de sus esbirros.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_07"); //¿Dragones? Según los antiguos escrituras, no se ve ninguno desde hace siglos.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_08"); //Dime, ¿por qué debería creer una palabra de lo que dices?
	AI_Output (other, self, "DIA_Lord_Hagen_Armee_15_09"); //Pero la cuestión no es si me crees o no. La cuestión es si puedes permitirte NO creerme si estoy diciendo la verdad.
	AI_Output (self, other, "DIA_Lord_Hagen_Armee_04_10"); //Mientras no tenga pruebas, no me puedo permitir enviar más hombres allí.
};

///////////////////////////////////////////////////////////////////////
//	Info Proof
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Proof (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Proof_Condition;
	information	 = 	DIA_Lord_Hagen_Proof_Info;
	permanent	 = 	TRUE;
	description	 =  "¿Así que quieres que te traiga una prueba?";
};
func int DIA_Lord_Hagen_Proof_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Lord_Hagen_Armee )
	&& (Hagen_BringProof == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Proof_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_00"); //¿Así que quieres que te traiga una prueba?

	IF (hero.guild != GIL_NONE)
	&& (hero.guild != GIL_NOV)
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_01"); //Exactamente. Cruza el paso y ve al Valle de las Minas. Una vez allí, busca la expedición y cuando la encuentres, habla con el comandante Garond.
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_02"); //Si alguien sabe lo pasa por allí, es él.
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_03"); //Si confirma tus palabras, podré ayudarte.
		AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_04"); //¿Eso significa que me darás el Ojo de Innos?
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_05"); //El Ojo de Innos... bien. Tráeme pruebas y luego me encargaré de que se te permita llevar el amuleto.
		AI_Output (other, self, "DIA_Lord_Hagen_Proof_15_06"); //¿Entonces puedo asumir que tengo tu palabra?
		AI_Output (self, other, "DIA_Lord_Hagen_Proof_04_07"); //Sí, la tienes.
		Hagen_BringProof = TRUE;
	}
	else
	{
		if (hero.guild == GIL_NOV)
		{
			PrintScreen	(PRINT_Addon_GuildNeeded_NOV, -1,-1, FONT_Screen ,2);
		}
		else 
		{	
			PrintScreen	(PRINT_Addon_GuildNeeded, -1,-1, FONT_Screen ,2);
		};	
		B_Say (self, other, "$NOLEARNNOPOINTS");
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info Auge
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Auge (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Auge_Condition;
	information	 = 	DIA_Lord_Hagen_Auge_Info;
	permanent	 = 	FALSE;
	description	 =  "¿Qué sabes del Ojo de Innos?";
};
func int DIA_Lord_Hagen_Auge_Condition ()
{	
	return TRUE;
};
func void DIA_Lord_Hagen_Auge_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Auge_15_00"); //¿Qué sabes del Ojo de Innos?
	AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_01"); //Es un artefacto divino. (Pensativo) En las antiguas profecías se menciona que tiene alguna relación con los dragones.
	AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_02"); //Sin embargo, los escrituras también dicen que solo lo puede llevar el elegido de Innos.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (other, self, "DIA_Lord_Hagen_Auge_15_03"); //¡YO SOY un elegido de Innos!
		AI_Output (self, other, "DIA_Lord_Hagen_Auge_04_04"); //Entonces quizá te sea posible llevar el amuleto.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Pass (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Pass_Condition;
	information	 = 	DIA_Lord_Hagen_Pass_Info;
	permanent	 = 	FALSE;
	description	 =  "¿Cómo se supone que voy a cruzar el paso?";
};
func int DIA_Lord_Hagen_Pass_Condition ()
{	
	if (Hagen_BringProof == TRUE)
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Pass_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Pass_15_00"); //¿Cómo se supone que voy a cruzar el paso?
	AI_Output (self, other, "DIA_Lord_Hagen_Pass_04_01"); //Te daré la llave de la puerta del paso. Sin embargo, dependerás de ti mismo para cruzar las líneas orcas.
	AI_Output (self, other, "DIA_Lord_Hagen_Pass_04_02"); //Que Innos te proteja.
		
	AI_StopProcessInfos (self);
	MIS_OLDWORLD = LOG_RUNNING;
	B_Kapitelwechsel (2, NEWWORLD_ZEN );
	CreateInvItems (self,ItKe_Pass_MIS,1);
	B_GiveInvItems (self,other,ItKe_Pass_MIS,1);
	
	Log_CreateTopic (Topic_MISOLDWORLD,LOG_MISSION);
	Log_SetTopicStatus (Topic_MISOLDWORLD,LOG_RUNNING);
	B_LogEntry (Topic_MISOLDWORLD,"Lord Hagen quiere que le consiga una prueba del ejército del mal. Voy a ir al Valle de las Minas a hablar con el Comandante Garond.");
	
	if (Fernando_ImKnast == FALSE)
	{
		B_StartOtherRoutine (Fernando,"WAIT"); 
	};
	
	Wld_InsertNpc (BDT_1020_Bandit_L, "NW_TROLLAREA_PATH_47");	//Joly: //ADDON stört dann nicht mehr
};

///////////////////////////////////////////////////////////////////////
//	Info Ornament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lord_Hagen_Ornament		(C_INFO)
{
	npc		 	= PAL_200_Hagen;
	nr		 	= 10;
	condition	= DIA_Addon_Lord_Hagen_Ornament_Condition;
	information	= DIA_Addon_Lord_Hagen_Ornament_Info;

	description	= "Estoy buscando un ornamento de metal.";
};

func int DIA_Addon_Lord_Hagen_Ornament_Condition ()
{
	if (MIS_Addon_Cavalorn_GetOrnamentFromPAL == LOG_RUNNING)
	&& (Lord_Hagen_GotOrnament == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lord_Hagen_Ornament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Lord_Hagen_GiveOrnament_15_00"); //Ando buscando un ornamento metálico. Debe de estar cerca del círculo de piedra, junto a la granja de Lobart.
	AI_Output	(self, other, "DIA_Addon_Lord_Hagen_GiveOrnament_04_01"); //Si te refieres a esto de aquí… creíamos que podía ser una runa mágica, pero ha resultado ser totalmente inservible.
	AI_Output	(self, other, "DIA_Addon_Lord_Hagen_GiveOrnament_04_02"); //Puedes quedártela, si quieres. A mí no me sirve para nada.
	
	CreateInvItems (self, ItMi_Ornament_Addon, 1);									
	B_GiveInvItems (self, other, ItMi_Ornament_Addon, 1);	
	Lord_Hagen_GotOrnament = TRUE;
	B_GivePlayerXP (XP_Ambient);	
};

///////////////////////////////////////////////////////////////////////
//	Info Khorinis
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Khorinis (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Khorinis_Condition;
	information	 = 	DIA_Lord_Hagen_Khorinis_Info;
	permanent	 = 	FALSE;
	description	 =  "¿Por qué has venido a Khorinis?";
};
func int DIA_Lord_Hagen_Khorinis_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_Armee))
	&& (Kapitel < 3)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Khorinis_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Khorinis_15_00"); //¿Por qué has venido a Khorinis?
	AI_Output (self, other, "DIA_Lord_Hagen_Khorinis_04_01"); //Estamos en una misión importante para nuestro reino. Tenemos órdenes directas del rey Khobar.
	AI_Output (self, other, "DIA_Lord_Hagen_Khorinis_04_02"); //Ya te he dicho que hemos enviado una expedición al Valle de las Minas. Ésa es la razón de nuestra presencia.
};

///////////////////////////////////////////////////////////////////////
//	Info Minental
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lord_Hagen_Minental (C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_Minental_Condition;
	information	 = 	DIA_Lord_Hagen_Minental_Info;
	permanent	 = 	TRUE;
	description	 =  "¿Qué hacen vuestros hombres en el Valle de las Minas?";
};
func int DIA_Lord_Hagen_Minental_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_Khorinis))
	&& (KnowsPaladins_Ore == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_Minental_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Minental_15_00"); //¿Qué están haciendo vuestros hombres en el Valle de las Minas?

	if (Hagen_BringProof == FALSE)
	{
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_01"); //¡No veo por qué debería decírtelo!
	}
	else
	{
		if (Garond.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_02"); //Has estado allí. Deberías saberlo.
		}
		else
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_03"); //De acuerdo, ya que de todas maneras vas a ir allí, puedo decírtelo.
		};
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_04"); //La clave es el mineral mágico. Puede decidir el destino de la guerra.
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_05"); //Sin suficientes armas de mineral mágico, el ejército del rey no tiene ninguna posibilidad contra los guerreros de élite de los orcos.
		if (other.guild != GIL_SLD)
		{
			AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_06"); //Y las minas de mineral de la isla son las últimas a las que todavía tenemos acceso.
		};
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_07"); //En cuanto nuestra nave esté llena de mineral, partiremos hacia el continente.
		KnowsPaladins_Ore = TRUE;
		
		AI_Output (other, self, "DIA_Lord_Hagen_Minental_15_08"); //¿Entonces la guerra contra los orcos va mal?
		AI_Output (self, other, "DIA_Lord_Hagen_Minental_04_09"); //Ya te he contado demasiado.
	};
};

///////////////////////////////////////////////////////////////////////
//	Can You Teach Me?
///////////////////////////////////////////////////////////////////////
instance DIA_Hagen_CanTeach		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	5;
	condition	 = 	DIA_Hagen_CanTeach_Condition;
	information	 = 	DIA_Hagen_CanTeach_Info;
	PERMANENT 	 =  FALSE;
	description	 = 	"Busco a un maestro de armas.";
};
func int DIA_Hagen_CanTeach_Condition ()
{	
	if (LordHagen_Teach2H == FALSE)
	&& (other.guild == GIL_PAL)
	&& (other.aivar[REAL_TALENT_2H] >= 90)
	&& (other.aivar[REAL_TALENT_2H] < 100)
	{
		return TRUE;
	};
};
func void DIA_Hagen_CanTeach_Info ()
{
	AI_Output (other, self, "DIA_Hagen_CanTeach_15_00"); //Busco a un maestro de armas.
	AI_Output (self, other, "DIA_Hagen_CanTeach_04_01"); //¿Sí? Has encontrado uno.
	
	LordHagen_Teach2H = TRUE;
	B_LogEntry (TOPIC_CityTeacher,"Lord Hagen puede enseñarme a luchar con armas a dos manos.");
};
//**************************************
//			Ich will trainieren
//**************************************
INSTANCE DIA_Hagen_Teach(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 100;
	condition	= DIA_Hagen_Teach_Condition;
	information	= DIA_Hagen_Teach_Info;
	permanent	= TRUE;
	description = "Empecemos (aprender combate a dos manos).";
};                       
//----------------------------------
var int DIA_Hagen_Teach_permanent;
//----------------------------------
FUNC INT DIA_Hagen_Teach_Condition()
{
	if (LordHagen_Teach2H == TRUE)
	&& (DIA_Hagen_Teach_permanent == FALSE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Hagen_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Hagen_Teach_15_00"); //Empecemos.
	
	Info_ClearChoices 	(DIA_Hagen_Teach);
	Info_AddChoice 		(DIA_Hagen_Teach,	DIALOG_BACK		,DIA_Hagen_Teach_Back);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Hagen_Teach_2H_1);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Hagen_Teach_2H_5);

};
FUNC VOID DIA_Hagen_Teach_Back ()
{
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output (self,other,"DIA_Hagen_Teach_04_00"); //Ahora eres un maestro de armas. No te puedo enseñar más.
		AI_Output (self,other,"DIA_Hagen_Teach_04_01"); //Que las acciones de tu futuro estén guiadas por la sabiduría de un maestro de armas.
		DIA_Hagen_Teach_permanent = TRUE;
	};
	Info_ClearChoices (DIA_Hagen_Teach);
};

FUNC VOID DIA_Hagen_Teach_2H_1 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100);
	
	Info_ClearChoices 	(DIA_Hagen_Teach);
	Info_AddChoice 		(DIA_Hagen_Teach,	DIALOG_BACK		,DIA_Hagen_Teach_Back);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)) ,DIA_Hagen_Teach_2H_1);	
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)) ,DIA_Hagen_Teach_2H_5);	
};

FUNC VOID DIA_Hagen_Teach_2H_5 ()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100);
	
	Info_ClearChoices 	(DIA_Hagen_Teach);
	Info_AddChoice 		(DIA_Hagen_Teach,	DIALOG_BACK		,DIA_Hagen_Teach_Back);
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Hagen_Teach_2H_1);	
	Info_AddChoice		(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Hagen_Teach_2H_5);	
	
};
//##############################################################
//###
//###	RitterAufnahme
//###
//##############################################################

//**************************************************************
//	Ich will auch ein Paladin werden.
//**************************************************************


INSTANCE DIA_Lord_Hagen_Knight		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	990;
	condition	 = 	DIA_Lord_Hagen_Knight_Condition;
	information	 = 	DIA_Lord_Hagen_Knight_Info;
	permanent	 = 	TRUE; 
	description	 = 	"Quiero entrar en el servicio de la orden.";
};
FUNC INT DIA_Lord_Hagen_Knight_Condition ()
{	
	if (hero.guild == GIL_MIL)	
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_Knight_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_Knight_15_00"); //Quiero ponerme al servicio de la orden.
	
	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_Knight_04_01"); //Bien, has demostrado que tienes la valentía, la habilidad y el conocimiento para servir a Innos.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_02"); //Tus acciones dan fe de la pureza de tu corazón.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_03"); //Si es tu deseo, te daré la bienvenida a nuestra orden.
		
		Info_ClearChoices (DIA_Lord_Hagen_Knight);
		Info_AddChoice (DIA_Lord_Hagen_Knight,"Todavía no estoy seguro.",DIA_Lord_Hagen_Knight_No);
		Info_AddChoice (DIA_Lord_Hagen_Knight,"¡Estoy listo!",DIA_Lord_Hagen_Knight_Yes);
	}
	else
	{
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_04"); //Ser un guerrero de Innos significa consagrarse completamente a la causa de Innos.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_05"); //Solo los guerreros más nobles y valientes son aceptados en nuestra orden.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Knight_04_06"); //Si estás completamente decidido a convertirte en paladín, deberás demostrar que eres digno.
	};
	
	Hagen_GaveInfoKnight = TRUE;	
};

FUNC VOID DIA_Lord_Hagen_Knight_No ()
{
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_No_15_00"); //Todavía no estoy seguro.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_No_04_01"); //Entonces ve y disipa las dudas de tu corazón. Vuelve cuando estés preparado.

	Info_ClearChoices (DIA_Lord_Hagen_Knight);
};

FUNC VOID DIA_Lord_Hagen_Knight_Yes()
{
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_Yes_15_00"); //¡Estoy listo!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_01"); //(Serio) ¡Entonces así será!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_02"); //(Serio) Muchos han tomado este camino y han dado su vida en nombre de Innos.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_03"); //(Serio) ¿Juras que tus actos honrarán sus muertes y proclamarán la fama de Innos?
	AI_Output (other,self ,"DIA_Lord_Hagen_Knight_Yes_15_04"); //¡Lo juro!
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_05"); //Entonces, de ahora en adelante, eres miembro de nuestra hermandad.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_06"); //Por mis poderes, te nombro guerrero de Innos.
	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_07"); //Te doy las armas y la armadura de un caballero. ¡Llévalas con orgullo, caballero!

	CreateInvItems (self,ITAR_PAL_M,1);
	B_GiveInvItems (self,other,ITAR_PAL_M,1);

	if ((other.HitChance[NPC_TALENT_2H]) >= (other.HitChance[NPC_TALENT_1H])) //Damit der SC auch seine Lieblingswaffe bekommt ;-)
	{
		CreateInvItems (self,ItMw_2h_Pal_Sword,1);
		B_GiveInvItems (self,other,ItMw_2h_Pal_Sword,1);
	}
	else
	{
		CreateInvItems (self,ItMw_1h_Pal_Sword,1);
		B_GiveInvItems (self,other,ItMw_1h_Pal_Sword,1);
	};		 
	
	AI_UnequipArmor (other);
	AI_EquipArmor 	(other,ITAR_PAL_M);

	AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_08"); //Por lo tanto, en virtud de tu rango, tendrás acceso al monasterio.

	if ((Npc_IsDead(Albrecht))== FALSE)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_Knight_Yes_04_09"); //Albretch te enseñará magia, solo tienes que ir a hablar con él.
	};
	
	AI_Output (self ,other,"DIA_Lord_Hagen_Add_04_02"); //Y, por supuesto, nuestros alojamientos del barrio alto de la ciudad están a tu disposición.

	hero.guild = GIL_PAL;
	Npc_SetTrueGuild (other, GIL_PAL);
	
	Info_ClearChoices (DIA_Lord_Hagen_Knight);
};


//***********************************************
//	Wie kann ich mich würdig erweisen
//***********************************************

INSTANCE DIA_Lord_Hagen_WhatProof		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	991;
	condition	 = 	DIA_Lord_Hagen_WhatProof_Condition;
	information	 = 	DIA_Lord_Hagen_WhatProof_Info;
	permanent	 = 	FALSE; 
	description	 = 	"¿Cómo puedo probar que soy digno?";
};

FUNC INT DIA_Lord_Hagen_WhatProof_Condition ()
{	
	if (Hagen_GaveInfoKnight == TRUE)	
	&& (MIS_RescueBennet != LOG_SUCCESS)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_WhatProof_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_WhatProof_15_00"); //¿Cómo puedo probar que soy digno?
	AI_Output			(self, other, "DIA_Lord_Hagen_WhatProof_04_01"); //Tus acciones determinarán si lo eres.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_02"); //Luchamos en nombre de Innos por la libertad y la justicia.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_03"); //Luchamos contra Beliar y sus seguidores, que quieren destruir el justo orden de Innos
	AI_Output			(other, self, "DIA_Lord_Hagen_WhatProof_15_04"); //Lo entiendo.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_05"); //¡No entiendes nada! Nuestro honor es nuestra vida y nuestra vida es Innos.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_06"); //Un paladín acude a la batalla alabando a Innos y muchos de los nuestros han perdido sus vidas en el altar de la lucha eterna entre el bien y el mal.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_07"); //Cada uno de nosotros se ha consagrado a esta tradición. Si fallamos, empañamos los actos de nuestros camaradas caídos.
	AI_Output			(self ,other, "DIA_Lord_Hagen_WhatProof_04_08"); //Solo aquellos que comprenden bien esto son dignos de ser paladines.
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

INSTANCE DIA_Lord_Hagen_KAP3_EXIT(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 999;
	condition	= DIA_Lord_Hagen_KAP3_EXIT_Condition;
	information	= DIA_Lord_Hagen_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lord_Hagen_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  				   PERM KAP 3
// ************************************************************

var int Hagen_KnowsEyeKaputt;
// --------------------------

INSTANCE DIA_Lord_Hagen_KAP3U4_PERM(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 998;
	condition	= DIA_Lord_Hagen_KAP3U4_PERM_Condition;
	information	= DIA_Lord_Hagen_KAP3U4_PERM_Info;
	permanent	= TRUE;
	description = "¿Cómo van las cosas?";
};                       
FUNC INT DIA_Lord_Hagen_KAP3U4_PERM_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_KAP3U4_PERM_Info()
{	
	AI_Output (other,self ,"DIA_Lord_Hagen_KAP3U4_PERM_15_00"); //¿Cuál es la situación?
	
	if (MIS_OLDWORLD == LOG_SUCCESS)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_04"); //Tengo que encontrar la forma de rescatar a la expedición.
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_05"); //Tenemos que hacer algo contra los dragones.
		if (Hagen_KnowsEyeKaputt == FALSE)
		{
			AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_06"); //(Para sí mismo) Puede que el Ojo de Innos pueda salvarnos después de todo...
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_01"); //Aquí me voy a volver loco. Soy un soldado, no un burócrata.
		AI_Output (self ,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_02"); //Con todo este papeleo que tengo que hacer, apenas recuerdo el tacto de la espada en mi mano.
	};
};

// ************************************************************
// 	  				   PERM KAP3U4
// ************************************************************

INSTANCE DIA_Lord_Hagen_EyeBroken(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 1;
	condition	= DIA_Lord_Hagen_EyeBroken_Condition;
	information	= DIA_Lord_Hagen_EyeBroken_Info;
	permanent	= FALSE;
	description = "Tengo el Ojo, está roto.";
};                       
FUNC INT DIA_Lord_Hagen_EyeBroken_Condition()
{
	if (Kapitel == 3)
	&& (MIS_ReadyForChapter4 == FALSE)
	&& (((Npc_HasItems (other,ItMi_InnosEye_Broken_MIS)) || (MIS_SCKnowsInnosEyeIsBroken  == TRUE)	))
	&& (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_EyeBroken_Info()
{	
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_07"); //Tengo el Ojo y está roto.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_08"); //¿QUÉ? ¡Por Innos! ¿Qué has hecho? ¡Necesitamos el Ojo!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_09"); //¡Habla con Pyrokar! Tiene que haber una manera de volverlo a recomponer.
	Hagen_KnowsEyeKaputt = TRUE;
};

//*********************************************************************
//	Info BACKINTOWN
//*********************************************************************

instance DIA_Lord_Hagen_BACKINTOWN		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	2;
	condition	 = 	DIA_Lord_Hagen_BACKINTOWN_Condition;
	information	 = 	DIA_Lord_Hagen_BACKINTOWN_Info;
	permanent	 = 	FALSE; 
	description	 = 	"Te traigo noticias de Garond.";
};
func int DIA_Lord_Hagen_BACKINTOWN_Condition ()
{	
	if (MIS_OLDWORLD == LOG_RUNNING)
	&& (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) >= 1)
	&& (Kapitel == 3)
	{
		return TRUE;
	};
};
func void DIA_Lord_Hagen_BACKINTOWN_Info ()
{
	AI_Output	(other, self, "DIA_Lord_Hagen_BACKINTOWN_15_00"); //Te traigo noticias de Garond. Toma, me ha dado esta nota para ti.
	B_GiveInvItems 	(other, self,ItWr_PaladinLetter_MIS,1);
	B_UseFakeScroll 	();  
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_01"); //Nuestra situación es peor de lo que me temía, pero infórmame de la situación en el Valle de las Minas.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_02"); //Los paladines están atrapados en el castillo del Valle de las Minas, rodeados por los orcos.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_03"); //Hubo muchas bajas en las expediciones de los prospectores y apenas queda mineral.
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_04"); //Bueno, y debería decir que, sin ayuda, los muchachos están perdidos. Ésa es la situación.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_05"); //Encontraré la manera de rescatar a la expedición. Has hecho mucho por nosotros. Que Innos te lo agradezca...
	AI_Output (other, self, "DIA_Lord_Hagen_BACKINTOWN_15_06"); //No estoy interesado para nada en su gratitud. Quiero su Ojo.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_07"); //Sí, claro. He empeñado mi palabra. Toma esta carta. Te abrirá las puertas del monasterio.
	AI_Output (self, other, "DIA_Lord_Hagen_BACKINTOWN_04_08"); //Habla con Pyrokar, el mago de fuego de rango superior, y muéstrale esta autorización. Te permitirá acceder al Ojo de Innos.
	
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_00"); //Una cosa más, antes de que te vayas...
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_01"); //Toma está runa como muestra de mi gratitud. Te traerá de vuelta a la ciudad, a salvo, siempre que así lo quieras.
	B_GiveInvItems (self, other, ItRu_TeleportSeaport, 1);
	
	
	CreateInvItems 		(self, ItWr_PermissionToWearInnosEye_MIS, 1);	
	B_GiveInvItems 		(self, other,ItWr_PermissionToWearInnosEye_MIS,1);
	MIS_InnosEyeStolen = TRUE;
	MIS_OLDWORLD = LOG_SUCCESS;
	
	B_LogEntry (TOPIC_INNOSEYE,"Lord Hagen me ha dado un mensaje. Hará que el maestro Pyrokar me dé el Ojo de Innos, que está en el monasterio.");

			Wld_InsertNpc 		(VLK_4250_Jorgen,"NW_MONASTERY_BRIDGE_01");
			Wld_InsertNpc		(BDT_1050_Landstreicher, "NW_TROLLAREA_NOVCHASE_01");
			Wld_InsertNpc		(BDT_1051_Wegelagerer, "NW_TROLLAREA_RITUALFOREST_09"); 
			Wld_InsertNpc		(BDT_1052_Wegelagerer, "NW_TROLLAREA_RITUALFOREST_09");
			B_KillNpc 			(BDT_1020_Bandit_L);	//Joly: macht Platz für DMT_1200_Dementor
			Wld_InsertNpc		(DMT_1200_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			//Wld_InsertNpc		(DMT_1201_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			Wld_InsertNpc		(DMT_1202_Dementor, "NW_TROLLAREA_RITUAL_01");
			//Wld_InsertNpc		(DMT_1203_Dementor, "NW_TROLLAREA_RITUAL_02");//Joly:waren zu viele!
			Wld_InsertNpc		(DMT_1204_Dementor, "NW_TROLLAREA_RITUAL_03");
			//Wld_InsertNpc		(DMT_1205_Dementor, "NW_TROLLAREA_RITUAL_04");
			Wld_InsertNpc		(DMT_1206_Dementor, "NW_TROLLAREA_RITUAL_05");
			Wld_InsertNpc		(DMT_1207_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			//Wld_InsertNpc		(DMT_1208_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			Wld_InsertNpc		(DMT_1209_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			Wld_InsertNpc		(DMT_1210_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			Wld_InsertNpc		(DMT_1211_Dementor, "NW_TROLLAREA_RITUALPATH_01");
			B_StartOtherRoutine (Pedro,"Tot"); 
				if (Npc_IsDead (MiltenNW))	//Wichtig, damit Milten vor dem Kloster steht!!!!!
				{ 
					Wld_InsertNpc (PC_MAGE_NW ,"NW_MONASTERY_ENTRY_01");
					B_StartOtherRoutine (MiltenNW,"START");		//zur Sicherheit
				};		
			Wld_InsertNpc		(NOV_650_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_650_ToterNovize);
			Wld_InsertNpc		(NOV_651_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_651_ToterNovize);
			Wld_InsertNpc		(NOV_652_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_652_ToterNovize);
			Wld_InsertNpc		(NOV_653_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_653_ToterNovize);
			Wld_InsertNpc		(NOV_654_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_654_ToterNovize);
			Wld_InsertNpc		(NOV_655_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_655_ToterNovize);
			Wld_InsertNpc		(NOV_656_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc (NOV_656_ToterNovize);
	
			TEXT_Innoseye_Setting	=	TEXT_Innoseye_Setting_Broken; 
			Wld_InsertItem		(ItMi_InnosEye_Broken_Mis , "FP_TROLLAREA_RITUAL_ITEM"); 
};

//--------Hier kommt der gesamte Befreie den schmied Klumpatsch-------------


//*********************************************************
//		Lasse Bennet aus dem Knast
//*********************************************************

var int Hagen_einmalBennet;
// -----------------------

INSTANCE DIA_Lord_Hagen_RescueBennet		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	3;
	condition	 = 	DIA_Lord_Hagen_RescueBennet_Condition;
	information	 = 	DIA_Lord_Hagen_RescueBennet_Info;
	permanent	 = 	TRUE; 
	description	 = 	"Tengo que hablarte de Bennet.";
};

FUNC INT DIA_Lord_Hagen_RescueBennet_Condition ()
{	
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (Cornelius_IsLiar == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_15_00"); //Tengo que hablarte de Bennet.
	
	if (Hagen_einmalBennet == FALSE)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_04_01"); //Pero ése es el mercenario que asesinó a uno de mis hombres.
		Hagen_einmalBennet = TRUE;
	};
	
	Info_ClearChoices  (DIA_Lord_Hagen_RescueBennet);
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,DIALOG_BACK,DIA_Lord_Hagen_RescueBennet_Back);
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"¿Cómo estás tan seguro de que Bennet es el asesino?",DIA_Lord_Hagen_RescueBennet_WhySure);
	/*
	if (RescueBennet_KnowsWitness == TRUE)
	{
		Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Wer ist der Zeuge?",DIA_Lord_Hagen_RescueBennet_Witness);
	};
	*/
	Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Creo que Bennet es inocente.",DIA_Lord_Hagen_RescueBennet_Innoscent);
		
	if (MIS_RescueBennet == LOG_RUNNING)
	&& (MIS_RitualInnosEyeRepair == LOG_RUNNING)
	&& (Hagen_KnowsEyeKaputt == TRUE)
	{
		Info_AddChoice (DIA_Lord_Hagen_RescueBennet,"Bennet podría ayudarnos a arreglar el Ojo de Innos.",DIA_Lord_Hagen_RescueBennet_Hilfe);
	};
};

func void DIA_Lord_Hagen_RescueBennet_Hilfe()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_16"); //Bennet podría ayudarnos a arreglar el Ojo de Innos.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_17"); //Aunque pudiera desencadenar el poder del mismo Innos...
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_18"); //Ha matado a un paladín. ¡Por ello será ejecutado!
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_Back()
{
	Info_ClearChoices  (DIA_Lord_Hagen_RescueBennet);
};

FUNC VOID DIA_Lord_Hagen_RescueBennet_WhySure()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_WhySure_15_00"); //¿Cómo estás tan seguro de que Bennet es el asesino?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_WhySure_04_01"); //Tenemos un testigo.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_WhySure_04_02"); //Como ves, no hay dudas de la culpabilidad del mercenario.
	//neu zusammengefasst M.F.
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Witness_15_00"); //¿Quién es el testigo?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_01"); //Cornelius, el secretario del gobernador, presenció el asesinato.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_02"); //Su descripción se corresponde con Bennet, de eso no hay duda. En lo que a mí respecta, eso zanja el asunto.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_03"); //El mercenario será ahorcado por traidor.

	B_LogEntry (TOPIC_RESCUEBENNET,"Cornelius, el secretario del gobernador, es el testigo. Asegura haber presenciado el asesinato."); 

	RecueBennet_KnowsCornelius = TRUE;
	//RescueBennet_KnowsWitness = TRUE; 
};
/*
FUNC VOID DIA_Lord_Hagen_RescueBennet_Witness()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Witness_15_00"); //Wer ist der Zeuge?
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_01"); //Cornelius, der Sekretär des Statthalters, hat den Mord gesehen.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_02"); //Seine Beschreibung trifft zweifelsfrei auf Bennet zu. Damit ist die Sache für mich erledigt.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_03"); //Der Söldner wird wegen Landesverrats hängen.

	B_LogEntry (TOPIC_RESCUEBENNET,"Cornelius, der Sekretär des Stadthalters, ist also der Zeuge. Er behauptet, den Mord beobachtet zu haben."); 

	RecueBennet_KnowsCornelius = TRUE;
};
*/
FUNC VOID DIA_Lord_Hagen_RescueBennet_Innoscent()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RescueBennet_Innoscent_15_00"); //Creo que Bennet es inocente.
	AI_Output			(self, other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_01"); //Las pruebas son claras. Es culpable.
	AI_Output			(other,self , "DIA_Lord_Hagen_RescueBennet_Innoscent_15_02"); //¿Y si la prueba no es real?
	AI_Output			(self ,other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_03"); //Cuidado con lo que dices. Estás realizando acusaciones muy serias.
	AI_Output			(self ,other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_04"); //Si no puedes presentarme pruebas de que el testigo ha mentido, entonces será mejor que te calles.
};


//**************************************************************
//	Cornelius hat gelogen.	
//**************************************************************

INSTANCE DIA_Lord_Hagen_Cornelius		(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	3;
	condition	 = 	DIA_Lord_Hagen_Cornelius_Condition;
	information	 = 	DIA_Lord_Hagen_Cornelius_Info;
	permanent	 = 	TRUE; 
	description	 = 	"Cornelius mintió.";
};

FUNC INT DIA_Lord_Hagen_Cornelius_Condition ()
{	
	if (Npc_HasItems (other,ItWr_CorneliusTagebuch_Mis) >= 1)
	&& (Cornelius_IsLiar == TRUE)
	&& (MIS_RescueBennet == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_Cornelius_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_Cornelius_15_00"); //Cornelius mintió.
	AI_Output			(self, other, "DIA_Lord_Hagen_Cornelius_04_01"); //¿Cómo lo sabes?
	AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_02"); //Aquí tengo su diario. Todo está en él.
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_03"); //(Furioso) ¡Despreciable criminal!
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_04"); //En vista de las nuevas pruebas, no puedo hacer nada más.
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_05"); //En virtud del poder que me han otorgado el Rey y la Iglesia, declaro...
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_06"); //... que el prisionero Bennet queda exonerado de todos los cargos y, por lo tanto, es hombre libre.
	
	B_StartOtherRoutine (Bennet,"START");
	B_StartOtherRoutine (Hodges,"START");
	
	AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_07"); //Cornelius será detenido de inmediato por perjuro.
	
	if (Npc_IsDead (Cornelius) == TRUE)
	{
		AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_08"); //Ahórrate el trabajo. Cornelius está muerto.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_09"); //Entonces ha recibido su justo castigo. Bien hecho.
	}
	else if (CorneliusFlee == TRUE)
	{
		AI_Output			(other,self , "DIA_Lord_Hagen_Cornelius_15_10"); //Se ha esfumado.
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_11"); //Tarde o temprano aparecerá. Entonces será arrestado.
		B_StartOtherRoutine (Cornelius,"FLED");
	}
	else 
	{
		B_StartOtherRoutine (Cornelius,"PRISON");
	};
	
	
	MIS_RescueBennet = LOG_SUCCESS;
	
	B_GivePlayerXP (XP_RescueBennet);
	
	if (hero.guild == GIL_MIL)
	{
		AI_Output			(self ,other, "DIA_Lord_Hagen_Cornelius_04_12"); //Tus obras redundarían en favor del honor de uno de los nuestros.
	};
};
//--------Hier endet der gesamte Befreie den Schmied Klumpatsch-------------




//**************************************************************
//	Auge Innos ganz!	
//**************************************************************

INSTANCE DIA_Lord_Hagen_AugeAmStart	(C_INFO)
{
	npc			 = 	PAL_200_Hagen;
	nr			 = 	4;
	condition	 = 	DIA_Lord_Hagen_AugeAmStart_Condition;
	information	 = 	DIA_Lord_Hagen_AugeAmStart_Info;
	permanent	 = 	FALSE; 
	description	 = 	"¡Soy el portador del Ojo!";
};

FUNC INT DIA_Lord_Hagen_AugeAmStart_Condition ()
{	
	if (Kapitel <= 4)
	&& (MIS_ReadyForChapter4 == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Lord_Hagen_AugeAmStart_Info ()
{
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_10"); //¡Soy el portador del Ojo!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_11"); //(Reverentemente) ¡Llevas el Ojo!
	if (Hagen_KnowsEyeKaputt == TRUE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_12"); //¡Y tienes que volverlo a unir!
	};
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_13"); //¡Entonces eres el elegido de Innos!
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_14"); //¡Partiré y mataré a todos los dragones del Valle de las Minas!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_15"); //¡Ve con Innos y destruye el mal con su poder!
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

INSTANCE DIA_Lord_Hagen_KAP4_EXIT(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 999;
	condition	= DIA_Lord_Hagen_KAP4_EXIT_Condition;
	information	= DIA_Lord_Hagen_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lord_Hagen_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info Antipaladine
///////////////////////////////////////////////////////////////////////

instance DIA_Lord_Hagen_ANTIPALADINE(C_INFO)
{
	npc		 	= 	PAL_200_Hagen;
	nr		 	= 	3;
	condition	 = 	DIA_Lord_Hagen_ANTIPALADINE_Condition;
	information	 = 	DIA_Lord_Hagen_ANTIPALADINE_Info;
	permanent	 = 	TRUE;

	description	 = 	"Los guerreros de élite orcos están atacando el país.";
};

func int DIA_Lord_Hagen_ANTIPALADINE_Condition ()
{
	if ((TalkedTo_AntiPaladin == TRUE) || (Npc_HasItems (other,ItRi_OrcEliteRing)))
	&& (Hagen_SawOrcRing == FALSE)
	&& (hero.guild == GIL_PAL)
		{
				return TRUE;
		};
};
var int Hagen_SawOrcRing;

func void DIA_Lord_Hagen_ANTIPALADINE_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_00"); //Los guerreros de élite orcos están atacando el país.

	Log_CreateTopic (TOPIC_OrcElite, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite, LOG_RUNNING);
	B_LogEntry (TOPIC_OrcElite,"He informado a lord Hagen del avance de las hordas de los señores de la guerra orcos."); 

	if (TalkedTo_AntiPaladin == TRUE)
	&& (MIS_KillOrkOberst == 0)
		{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_01"); //¿Por qué lo dices?
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_02"); //He hablado con uno de ellos. Se mencionó tu nombre.
		};

		AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_03"); //Tonterías. Mi gente no me ha informado hasta ahora de invasiones a gran escala de orcos.
		AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_04"); //Quizá algunos de sus exploradores se perdieron en los bosques cercanos.

	if (Npc_HasItems (other,ItRi_OrcEliteRing))
		{
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_05"); //No eran exploradores. Le cogí este anillo a uno de ellos.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_06"); //Enséñamelo.
			B_GiveInvItems 		(other, self, ItRi_OrcEliteRing,1);
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_07"); //Mmm. Ciertamente es preocupante.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_08"); //Es una señal de su fuerza. Los orcos han abandonado sus empalizadas y luchan en campo abierto.
			AI_Output			(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_09"); //Por ahora no he visto demasiados. Sobre todo señores de la guerra y unos pocos guerreros.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_10"); //¿Sí? Eso quiere decir que están planeando algo diferente. No es propio de los orcos que sus líderes abandonen solos sus empalizadas.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_11"); //Sin embargo, sería una buena oportunidad para dar un golpe de efecto.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_12"); //Si pierden a sus líderes, su moral se derrumbará.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_13"); //Caballero, tienes una nueva misión. Ve y mata a todos los líderes orcos que puedas encontrar en la zona.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_14"); //Tráeme sus anillos. Será todo un golpe para los orcos.
			
			B_LogEntry (TOPIC_OrcElite,"He podido llevar a Hagen, como prueba, un anillo de un señor de la guerra orco. Quiere que le lleve todos los que pueda encontrar."); 
	
			if (Npc_IsDead(Ingmar)==FALSE)
			&& (MIS_KillOrkOberst == 0)
			{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_15"); //Habla con Ingmar. Puede darte unos cuantos consejos tácticos para luchar con los líderes orcos.
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_16"); //Los guerreros de élite orcos son su especialidad. Ha tenido que vérselas con ellos muchas veces.
			B_LogEntry (TOPIC_OrcElite,"Los guerreros de élite orcos son la especialidad de Ingmar."); 
			};
			

			Hagen_SawOrcRing = TRUE;
			B_GivePlayerXP (XP_PAL_OrcRing);
		}
		else
		{
			if  (MIS_KillOrkOberst == LOG_SUCCESS)
			{
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_17"); //No me basta solo con que afirmes que has matado al caudillo orco.
			};
			AI_Output			(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_18"); //Si voy a reaccionar ante eso, necesito pruebas más tangibles.
		
			B_LogEntry (TOPIC_OrcElite,"Hagen no está dispuesto a creerme. Quiere pruebas de que los guerreros de élite están atacando tierras civilizadas. Bueno, lo raro hubiera sigo que no las pidiera."); 
		};
};

///////////////////////////////////////////////////////////////////////
//	Info RingeBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Lord_Hagen_RINGEBRINGEN		(C_INFO)
{
	npc		 = 	PAL_200_Hagen;
	nr		 = 	5;
	condition	 = 	DIA_Lord_Hagen_RINGEBRINGEN_Condition;
	information	 = 	DIA_Lord_Hagen_RINGEBRINGEN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Hay algo más de lo que tengo que informar, acerca de los señores de la guerra orcos.";
};

func int DIA_Lord_Hagen_RINGEBRINGEN_Condition ()
{
	if (Hagen_SawOrcRing == TRUE)
	&& (Npc_HasItems (other,ItRi_OrcEliteRing) >= 1)
	&& (hero.guild == GIL_PAL)
		{
				return TRUE;
		};
};

var int OrkRingCounter;

func void DIA_Lord_Hagen_RINGEBRINGEN_Info ()
{
	AI_Output			(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_00"); //Tengo que informar de algo más acerca de los señores de la guerra orcos.
	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_01"); //Dime.

	var int Ringcount;
	var int XP_PAL_OrcRings;
	var int OrcRingGeld;
	var int HagensRingOffer;

	HagensRingOffer = 150; //Joly: Geld für einen Orkring

	Ringcount = Npc_HasItems(other, ItRi_OrcEliteRing);


	if (Ringcount == 1)
		{
			AI_Output		(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_02"); //Te puedo dar otro anillo orco.
			B_GivePlayerXP (XP_PAL_OrcRing);
			B_GiveInvItems (other, self, ItRi_OrcEliteRing,1);
			OrkRingCounter = OrkRingCounter + 1;
		}
		else
		{
			AI_Output		(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_03"); //Te puedo dar más anillos orcos.

			B_GiveInvItems (other, self, ItRi_OrcEliteRing,  Ringcount);

			XP_PAL_OrcRings = (Ringcount * XP_PAL_OrcRing);
			OrkRingCounter = (OrkRingCounter + Ringcount); 

			B_GivePlayerXP (XP_PAL_OrcRings);
		};

	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_04"); //Estoy orgulloso de ti. ¡Sigue así!

	if (OrkRingCounter <= 10)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_05"); //Puede que todavía quede alguno ahí fuera.
	}
	else if	(OrkRingCounter <= 20)
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_06"); //Pronto los tendremos de rodillas.
	}
	else
	{
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_07"); //Me sorprendería que encontraras muchos.
		AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_08"); //Si sigues trayéndome anillos, serán bienvenidos. Pero creo que los orcos ya han captado el mensaje.
		TOPIC_END_OrcElite = TRUE;
	};

	AI_Output			(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_09"); //Toma. Deja que te dé algo de oro para que compres equipo.

	OrcRingGeld	= (Ringcount * HagensRingOffer);	

	CreateInvItems (self, ItMi_Gold, OrcRingGeld); 
	B_GiveInvItems (self, other, ItMi_Gold, OrcRingGeld);
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

INSTANCE DIA_Lord_Hagen_KAP5_EXIT(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 999;
	condition	= DIA_Lord_Hagen_KAP5_EXIT_Condition;
	information	= DIA_Lord_Hagen_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Lord_Hagen_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//****************************************************************************
//		Die Drachen sind tot
//****************************************************************************

INSTANCE DIA_Lord_Hagen_AllDragonsDead(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 4;
	condition	= DIA_Lord_Hagen_AllDragonsDead_Condition;
	information	= DIA_Lord_Hagen_AllDragonsDead_Info;
	permanent	= FALSE;
	description = "Los dragones están muertos.";
};                       
FUNC INT DIA_Lord_Hagen_AllDragonsDead_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_AllDragonsDead_Info()
{	
	AI_Output (other,self ,"DIA_Lord_Hagen_AllDragonsDead_15_00"); //Los dragones están muertos.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_19"); //¡Sabía que Innos te daría la fuerza necesaria para derrotar a los dragones!
	AI_Output (self ,other,"DIA_Lord_Hagen_AllDragonsDead_04_02"); //¿Dónde está el mineral?
	AI_Output (other,self ,"DIA_Lord_Hagen_AllDragonsDead_15_03"); //Los orcos aún asedian el castillo del Valle de las Minas. Garond no tiene posibilidades de salir del castillo si no se interrumpe el asedio.
	
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_20"); //(Furioso) ¡Maldita sea!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_21"); //Si Garond no puede manejar la situación, entonces tendré que encargarme en persona.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_22"); //¡Unos cuantos orcos no van a pararme! ¡No a mí!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_23"); //Ya he informado a mis hombres. Estamos preparándonos para partir.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_24"); //Iremos TODOS. Solo dejaré una guardia mínima en el barco.
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_25"); //¡Debería ser suficiente para acabar de una vez con los orcos!

	MIS_SCVisitShip = LOG_RUNNING;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"ShipFree");	
};

// ************************************************************
// 	  				   Ich brauche das Schiff
// ************************************************************

INSTANCE DIA_Lord_Hagen_NeedShip(C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 4;
	condition	= DIA_Lord_Hagen_NeedShip_Condition;
	information	= DIA_Lord_Hagen_NeedShip_Info;
	permanent	= FALSE;
	description = "Necesito un barco.";
};                       
FUNC INT DIA_Lord_Hagen_NeedShip_Condition()
{
	if (ItWr_SCReadsHallsofIrdorath == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_NeedShip_Info()
{	
	AI_Output (other,self ,"DIA_Lord_Hagen_NeedShip_15_00"); //Necesito un barco.

	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_01"); //Como tantos otros, soldado.
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_02"); //(Risas) Escucho eso casi cada día, reverendo. Pero...
	};

	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_03"); //Ni siquiera cuentas con un capitán, por no hablar de una tripulación.
	AI_Output (other,self ,"DIA_Lord_Hagen_NeedShip_15_04"); //¿Qué hay del barco del puerto?
	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_05"); //Me pertenece y con eso basta. Transportaremos el mineral con esta nave.
	AI_Output (self ,other,"DIA_Lord_Hagen_NeedShip_04_06"); //Cuando hayamos acabado, puedes volver a preguntarme.
};


// ************************************************************
// 	  				 Tor auf
// ************************************************************

INSTANCE DIA_Lord_Hagen_GateOpen (C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 5;
	condition	= DIA_Lord_Hagen_GateOpen_Condition;
	information	= DIA_Lord_Hagen_GateOpen_Info;
	permanent	= FALSE;
	description = "¡Los orcos han asaltado el castillo del Valle de las Minas!";
};                       
FUNC INT DIA_Lord_Hagen_GateOpen_Condition()
{
	if (MIS_OCGateOpen == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Lord_Hagen_AllDragonsDead))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_GateOpen_Info()
{	
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_29"); //¡Los orcos han asaltado el castillo del Valle de las Minas!
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_30"); //¡Por Innos! ¿Qué es lo que ha pasado allí?
	AI_Output (other, self, "DIA_Lord_Hagen_Add_15_31"); //La puerta ha tenido que abrirse de alguna manera...
	AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_32"); //¡¿De alguna manera?! ¿Cómo ha podido pasar...? ¡Debe de haber un traidor en el castillo!
};

// ************************************************************
// 	  						 PERM
// ************************************************************

INSTANCE DIA_Lord_Hagen_Perm5 (C_INFO)
{
	npc			= PAL_200_Hagen;
	nr			= 5;
	condition	= DIA_Lord_Hagen_Perm5_Condition;
	information	= DIA_Lord_Hagen_Perm5_Info;
	permanent	= TRUE;
	description = "¿A qué esperas?";
};                       
FUNC INT DIA_Lord_Hagen_Perm5_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Lord_Hagen_AllDragonsDead))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lord_Hagen_Perm5_Info()
{	
	AI_Output (other,self, "DIA_Lord_Hagen_Add_15_33"); //¿A qué esperas?
	if (MIS_OCGateOpen == FALSE)
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_26"); //Aún esperamos el equipo y las provisiones. ¡Entonces partiremos!
	}
	else
	{
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_27"); //Ahora que el castillo ha sido asaltado, necesitaremos aún más provisiones.
		AI_Output (self ,other, "DIA_Lord_Hagen_Add_04_28"); //Pero nuestra partida no se retrasará demasiado.
	};
};
