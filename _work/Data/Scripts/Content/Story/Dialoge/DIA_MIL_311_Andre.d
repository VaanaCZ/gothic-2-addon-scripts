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
	AI_Output (self ,other,"DIA_Andre_Add_08_00"); //Ich habe von einem meiner Männer gehört, es wären Steckbriefe von dir in Umlauf.
	AI_Output (self ,other,"DIA_Andre_Add_08_01"); //Er sagt auch, du hättest die Sache zuerst abgestritten.
	AI_Output (self ,other,"DIA_Andre_Add_08_02"); //Was ist an der Sache dran?
	AI_Output (other, self,"DIA_Andre_Add_15_03"); //Ich weiß nicht, warum die Kerle mich suchen...
	AI_Output (self ,other,"DIA_Andre_Add_08_04"); //Ich hoffe für dich, daß das stimmt.
	AI_Output (self ,other,"DIA_Andre_Add_08_05"); //Ich kann niemanden bei der Miliz gebrauchen, der Dreck am Stecken hat.
	AI_Output (self ,other,"DIA_Andre_Add_08_06"); //Die Banditen sind fast alle ehemalige Gefangene aus der Minenkolonie.
	AI_Output (self ,other,"DIA_Andre_Add_08_07"); //Ich will nicht hoffen, daß du dich auf irgendeine Weise mit den Halsabschneidern eingelassen hast!
	Andre_Steckbrief = TRUE;
};

// ************************************************************
// 	  				   	Canthar Falle 
// ************************************************************
var int Andre_CantharFalle; //damit es nur EINMAL kommt
// ------------------------

func void B_Andre_CantharFalle()
{
	AI_Output (self, other, "B_Andre_CantharFalle_08_00"); //Der Händler Canthar war hier. Er hat erzählt, dass du ein entflohener Sträfling aus der Minenkolonie bist.
	AI_Output (self, other, "B_Andre_CantharFalle_08_01"); //Ich weiß nicht, was da dran ist, und ich werde dich auch besser nicht fragen, aber du solltest das klären.
	
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
	AI_Output (self, other, "DIA_Andre_PMSchulden_08_00"); //Bist du gekommen, um deine Strafe zu zahlen?

						
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
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_01"); //Ich hatte mich schon gefragt, ob du es überhaupt noch wagst, hierher zu kommen!
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_02"); //Anscheinend ist es nicht bei den letzten Anschuldigungen geblieben!
		if (Andre_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_03"); //Ich hatte dich gewarnt! Die Strafe, die du jetzt zahlen musst, ist höher!
			AI_Output (other, self, "DIA_Andre_PMAdd_15_00"); //Wieviel?
			
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
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_04"); //Du hast mich schwer enttäuscht!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Andre_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_05"); //Es haben sich einige neue Dinge ergeben.
		
		if (Andre_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_06"); //Plötzlich gibt es niemanden mehr, der dich des Mordes bezichtigt.
		};
		
		if (Andre_LastPetzCrime == CRIME_THEFT)
		|| ( (Andre_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_07"); //Niemand erinnert sich mehr, dich bei einem Diebstahl gesehen zu haben.
		};
		
		if (Andre_LastPetzCrime == CRIME_ATTACK)
		|| ( (Andre_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_08"); //Es gibt keine Zeugen mehr dafür, dass du jemals in eine Schlägerei verwickelt warst.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_09"); //Anscheinend haben sich alle Anklagen gegen dich in Wohlgefallen aufgelöst.
		};
		
		AI_Output (self, other, "DIA_Andre_PMSchulden_08_10"); //Ich weiß nicht, was da gelaufen ist, aber ich warne dich: Spiel keine Spielchen mit mir.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_11"); //Ich habe mich jedenfalls entschieden, dir deine Schulden zu erlassen.
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_12"); //Sieh zu, dass du nicht wieder in Schwierigkeiten kommst.
	
			Andre_Schulden			= 0;
			Andre_LastPetzCounter 	= 0;
			Andre_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_13"); //Damit eins klar ist: Deine Strafe musst du trotzdem in voller Höhe zahlen.
			B_Say_Gold (self, other, Andre_Schulden);
			AI_Output (self, other, "DIA_Andre_PMSchulden_08_14"); //Also, was ist?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Andre_PMSchulden);
		Info_ClearChoices  	(DIA_Andre_PETZMASTER);
		Info_AddChoice		(DIA_Andre_PMSchulden,"Ich habe nicht genug Gold!",DIA_Andre_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Andre_PMSchulden,"Wieviel war es nochmal?",DIA_Andre_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
		{
			Info_AddChoice 	(DIA_Andre_PMSchulden,"Ich will die Strafe zahlen.",DIA_Andre_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Andre_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Andre_PMSchulden_HowMuchAgain_15_00"); //Wie viel war es noch mal?
	B_Say_Gold (self, other, Andre_Schulden);

	Info_ClearChoices  	(DIA_Andre_PMSchulden);
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_AddChoice		(DIA_Andre_PMSchulden,"Ich habe nicht genug Gold!",DIA_Andre_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Andre_PMSchulden,"Wieviel war es nochmal?",DIA_Andre_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice 	(DIA_Andre_PMSchulden,"Ich will die Strafe zahlen.",DIA_Andre_PETZMASTER_PayNow);
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
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_00"); //Du musst der Neue sein, der hier in der Stadt Ärger gemacht hat.
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
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_01"); //Gut, dass du zu mir kommst, bevor alles noch schlimmer für dich wird.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_02"); //Mord ist ein schweres Vergehen!
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Andre_Schulden = Andre_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_03"); //Ganz zu schweigen von den anderen Sachen, die du angerichtet hast.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_04"); //Die Wachen haben Befehl, jeden Mörder auf der Stelle zu richten.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_05"); //Und auch die meisten Bürger werden einen Mörder in der Stadt nicht dulden!
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_06"); //Ich habe kein Interesse daran, dich an den Galgen zu bringen. Wir sind im Krieg und wir brauchen jeden Mann.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_07"); //Aber es wird nicht leicht sein, die Leute wieder gnädig zu stimmen.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_08"); //Du könntest deine Reue zeigen, indem du eine Strafe zahlst - natürlich muss die Strafe angemessen hoch sein.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_09"); //Gut, dass du kommst! Du wirst des Diebstahls bezichtigt! Es gibt Zeugen!
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_10"); //Von den anderen Dingen, die mir zu Ohren gekommen sind, will ich gar nicht erst reden.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_11"); //Ich werde so ein Verhalten in der Stadt nicht dulden!
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_12"); //Du wirst eine Strafe zahlen müssen, um dein Verbrechen wieder gutzumachen!
		
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_13"); //Wenn du dich mit dem Gesindel im Hafen herumprügelst, ist das eine Sache ...
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_14"); //Aber wenn du Bürger oder Soldaten des Königs angreifst, muss ich dich zur Rechenschaft ziehen.
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Andre_PETZMASTER_08_15"); //Und die Sache mit den Schafen musste wohl auch nicht sein.
		};
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_16"); //Wenn ich dir das durchgehen lasse, macht hier bald jeder, was er will.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_17"); //Also wirst du eine angemessene Strafe zahlen - und die Sache ist vergessen.
		
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_18"); //Mir ist zu Ohren gekommen, du hättest dich an unseren Schafen vergriffen.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_19"); //Dir ist klar, dass ich das nicht durchgehen lassen kann.
		AI_Output (self, other, "DIA_Andre_PETZMASTER_08_20"); //Du wirst eine Entschädigung zahlen müssen!
		
		Andre_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Andre_PETZMASTER_15_21"); //Wie viel?
	
	if (Andre_Schulden > 1000)	{	Andre_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Andre_Schulden);
	
	Info_ClearChoices  	(DIA_Andre_PMSchulden);
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_AddChoice		(DIA_Andre_PETZMASTER,"Ich habe nicht genug Gold!",DIA_Andre_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice 	(DIA_Andre_PETZMASTER,"Ich will die Strafe zahlen.",DIA_Andre_PETZMASTER_PayNow);
	};
};

func void DIA_Andre_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Andre_PETZMASTER_PayNow_15_00"); //Ich will die Strafe zahlen!
	B_GiveInvItems (other, self, itmi_gold, Andre_Schulden);
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayNow_08_01"); //Gut! Ich werde dafür sorgen, dass es jeder in der Stadt erfährt - damit wäre dein Ruf einigermaßen wiederhergestellt.

	B_GrantAbsolution (LOC_CITY);
	
	Andre_Schulden			= 0;
	Andre_LastPetzCounter 	= 0;
	Andre_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Andre_PETZMASTER);
	Info_ClearChoices  	(DIA_Andre_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Andre_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Andre_PETZMASTER_PayLater_15_00"); //Ich habe nicht genug Gold!
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayLater_08_01"); //Dann sieh zu, dass du das Gold so schnell wie möglich beschaffst.
	AI_Output (self, other, "DIA_Andre_PETZMASTER_PayLater_08_02"); //Und ich warne dich: Wenn du dir noch was zu schulden kommen lässt, wird die Sache noch schlimmer für dich!
	
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
	AI_Output (self, other, "DIA_Andre_Hallo_08_00"); //Innos sei mit dir, Fremder! Was führt dich zu mir?
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
	description = "Ich habe eine wichtige Nachricht für Lord Hagen.";
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
	AI_Output (other, self, "DIA_Andre_Message_15_00"); //Ich habe eine wichtige Nachricht für Lord Hagen.
	AI_Output (self, other, "DIA_Andre_Message_08_01"); //Nun, du stehst vor einem seiner Männer. Worum geht es?
	
	Info_ClearChoices (DIA_Andre_Message);
	Info_AddChoice (DIA_Andre_Message, "Das muß ich Lord Hagen selbst sagen.", DIA_Andre_Message_Personal);
	Info_AddChoice (DIA_Andre_Message, "Die Armeen der Orks werden von DRACHEN angeführt!", DIA_Andre_Message_Dragons);
	Info_AddChoice (DIA_Andre_Message, "Es geht um ein heiliges Artefakt - das Auge Innos.", DIA_Andre_Message_EyeInnos);
};

func void B_Andre_LordHagenNichtZuSprechen()
{
	AI_Output (self, other, "B_Andre_LordHagenNichtZuSprechen_08_00"); //Lord Hagen empfängt nur Paladine oder diejenigen, die im Dienst der Paladine stehen.
	AI_Output (self, other, "B_Andre_LordHagenNichtZuSprechen_08_01"); //Es ist unter seiner Würde, sich mit Vertretern des gemeinen Volkes abzugeben.
};

func void DIA_Andre_Message_EyeInnos()
{
	AI_Output (other, self, "DIA_Andre_Message_EyeInnos_15_00"); //Es geht um ein heiliges Artefakt - das Auge Innos'.
	AI_Output (self, other, "DIA_Andre_Message_EyeInnos_08_01"); //Das Auge Innos' - ich habe noch nie davon gehört. Aber das muss nichts heißen.
	AI_Output (self, other, "DIA_Andre_Message_EyeInnos_08_02"); //Wenn es wirklich ein Artefakt gibt, das diesen Namen trägt, wissen sowieso nur die höchsten Mitglieder unseres Ordens etwas darüber.
	AI_Output (other, self, "DIA_Andre_Message_EyeInnos_15_03"); //Eben darum muss ich ja mit Lord Hagen selbst reden.
	
	Andre_EyeInnos = TRUE;
	
	B_Andre_LordHagenNichtZuSprechen();
	
	Info_ClearChoices (DIA_Andre_Message);
};
func void DIA_Andre_Message_Dragons()
{
	AI_Output (other, self, "DIA_Andre_Message_Dragons_15_00"); //Die Armeen der Orks werden von DRA-
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_01"); //(fällt ins Wort) Ich WEISS, dass die Armeen der Orks immer stärker werden.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_02"); //Du willst mir doch wohl nicht erzählen, dass es DAS ist, was du Lord Hagen zu berichten hast.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_03"); //Er würde dir den Kopf abreißen, wenn du seine Zeit mit solchen Geschichten verschwendest.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_04"); //Und ich bin mir sicher, du bist schlau genug, um das selbst zu wissen.
	AI_Output (self, other, "DIA_Andre_Message_Dragons_08_05"); //Also, worum geht es wirklich?
};
func void DIA_Andre_Message_Personal()
{
	AI_Output (other, self, "DIA_Andre_Message_Personal_15_00"); //Das muss ich Lord Hagen selbst sagen.
	AI_Output (self, other, "DIA_Andre_Message_Personal_08_01"); //Wie du meinst. Aber du solltest eins wissen:
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
	description	 = 	"Warum seid ihr Paladine in der Stadt?";	
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
	AI_Output (other, self, "DIA_Andre_Paladine_15_00"); //Warum seid ihr Paladine in der Stadt?
	AI_Output (self, other, "DIA_Andre_Paladine_08_01"); //Die Ziele unserer Mission unterliegen der Geheimhaltung.
	AI_Output (self, other, "DIA_Andre_Paladine_08_02"); //Ich kann dir nur soviel sagen, dass keine Gefahr für die Bürger der Stadt besteht.
	AI_Output (self, other, "DIA_Andre_Paladine_08_03"); //Du brauchst dir keine Sorgen zu machen.
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
	description	 = 	"Warum seid ihr Paladine in der Stadt?";	
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
		AI_Output (other, self, "DIA_Andre_PaladineAgain_15_00"); //Erzählst du mir jetzt, warum ihr Paladine nach Khorinis gekommen seid?
	}
	else
	{
		AI_Output (other, self, "DIA_Andre_PaladineAgain_15_01"); //Warum seid ihr Paladine in der Stadt?
	};
	
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_02"); //Du gehörst jetzt zur Stadtwache, also bist auch du den Paladinen unterstellt.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_03"); //Jetzt kann ich dich ins Vertrauen ziehen.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_04"); //Wir kommen im Auftrag von König Rhobar. Durch den Fall der Barriere sind die Erzlieferungen ausgeblieben.
	AI_Output (self, other, "DIA_Andre_PaladineAgain_08_05"); //Deshalb holen wir uns das Erz und bringen es zum Festland. Mit dem Erz werden wir neue Waffen schmieden und die Orks zurückschlagen.
	
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
	description = "Ich will mich in den Dienst der Paladine stellen!";
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
	AI_Output (other, self, "DIA_Andre_AskToJoin_15_00"); //Ich will mich in den Dienst der Paladine stellen!

	if (Npc_KnowsInfo(other,DIA_Andre_Message))
	{
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_01"); //Gut. Ich kann jeden tauglichen Mann hier gut gebrauchen. Egal, aus welchen Gründen er uns beitritt.
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_02"); //Wenn du dich in den Dienst der Paladine stellst, werde ich dir zu einer Audienz bei Lord Hagen verhelfen.
	}
	else
	{
		AI_Output (self, other, "DIA_Andre_AskToJoin_08_03"); //Ein ehrenwertes Anliegen.
	};
	
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_04"); //Ich habe jedoch meine Befehle, nur Bürger der Stadt bei der Miliz aufzunehmen.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_05"); //Mein Kommandant befürchtet, dass sich Spione oder Saboteure bei uns einschleichen könnten.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_06"); //Auf diese Weise will er das Risiko begrenzen.
	AI_Output (self, other, "DIA_Andre_AskToJoin_08_07"); //Du musst also zuerst Bürger der Stadt werden - über den Sinn dieser Regel lässt sich sicherlich streiten, aber Befehl ist Befehl.
	
	Log_CreateTopic (TOPIC_BecomeMIL,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BecomeMIL,LOG_RUNNING);
	B_LogEntry (TOPIC_BecomeMIL,"Um bei der Stadtwache aufgenommen zu werden, muss ich erst Bürger der Stadt werden.");
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
	description	 = 	"Was erwartet mich bei der Miliz?";
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
	AI_Output (other, self, "DIA_Andre_AboutMiliz_15_00"); //Was erwartet mich bei der Miliz?
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_01"); //Um das gleich klarzustellen. Soldat der Miliz zu sein, bedeutet weit mehr, als nur mit einer Uniform durch die Stadt zu spazieren.
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_02"); //Das ist ein dreckiger und auch blutiger Job. Wenn du einmal dabei bist, wartet ein Haufen Arbeit auf dich.
	AI_Output (self, other, "DIA_Andre_AboutMiliz_08_03"); //Aber es lohnt sich. Neben dem Sold bekommst du vielleicht irgendwann einmal die Chance, ein heiliger Streiter Innos' zu werden.
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

	description	 = 	"Ich habe hier ein Empfehlungsschreiben von eurem Proviantmeister.";
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
	AI_Output	(other, self, "DIA_Addon_Andre_MartinEmpfehlung_15_00"); //Ich habe hier ein Empfehlungsschreiben von eurem Proviantmeister.
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_01"); //(ungläubig) Was? Zeig mal her.
	B_GiveInvItems (other, self, ItWr_Martin_MilizEmpfehlung_Addon,1);
	B_UseFakeScroll();
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_02"); //(beeindruckt) Donnerwetter! Da hast du dich wohl schwer ins Zeug gelegt, was? Martin ist mit sowas eigentlich nicht so freizügig.
	AI_Output	(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_03"); //Na gut. Das überzeugt mich. Wenn Martin für dich bürgt, dann werde ich dich auch aufnehmen. Sag mir, wenn du bereit bist.
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
	description = "Gibt es keinen schnelleren Weg, mich euch anzuschließen?";
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
	AI_Output (other, self, "DIA_Andre_Alternative_15_00"); //Gibt es keinen schnelleren Weg, mich euch anzuschließen?
	AI_Output (self, other, "DIA_Andre_Alternative_08_01"); //Mmh (stutzt) - es ist dir wirklich ernst, oder?
	AI_Output (self, other, "DIA_Andre_Alternative_08_02"); //Gut, hör zu. Ich habe ein Problem. Wenn du es für mich löst, werde ich dafür sorgen, dass du bei der Miliz aufgenommen wirst.
	AI_Output (self, other, "DIA_Andre_Alternative_08_03"); //Aber das Wichtigste ist: Du darfst mit niemandem darüber reden!
	
	
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
	description = "Was ist dein Problem?";
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
	AI_Output (other, self, "DIA_Andre_GuildOfThieves_15_00"); //Was ist dein Problem?
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_01"); //In letzter Zeit häufen sich die Diebstähle in der Stadt. Wir konnten bisher niemanden fassen, die Diebe gehen einfach zu geschickt vor.
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_02"); //Die Mistkerle verstehen ihr Handwerk. Ich bin mir sicher, dass es sich um eine organisierte Bande handelt.
	AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_03"); //Es würde mich nicht wundern, wenn es in Khorinis eine Diebesgilde gäbe. Finde die Drahtzieher der Bande und bring sie zur Strecke.
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_04"); //Dann werde ich dafür sorgen, dass du bei der Miliz aufgenommen wirst - egal, ob du Bürger bist oder nicht.
		AI_Output (self, other, "DIA_Andre_GuildOfThieves_08_05"); //Aber du musst über unsere Abmachung schweigen!
	};
	
	MIS_Andre_GuildOfThieves = LOG_RUNNING;
	B_LogEntry (TOPIC_BecomeMIL,"Es gibt noch eine andere Möglichkeit, um bei der Stadtwache aufgenommen zu werden. Ich muss die Diebesgilde in Khorinis finden und zur Strecke bringen.");
	
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
	description = "Wo fange ich an, nach den Dieben zu suchen?";
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
	AI_Output (other, self, "DIA_Andre_WhereThieves_15_00"); //Wo fange ich an, nach den Dieben zu suchen?
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_01"); //Wenn ich das wüsste, würde ich selber dort hingehen!
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_02"); //Ich kann dir nur soviel sagen: Wir haben vor kurzem das gesamte Hafenviertel auf den Kopf gestellt und nichts, aber auch gar nichts gefunden.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_03"); //Die Leute dort sind auch nicht sehr gesprächig, vor allem nicht, wenn man die Rüstung eines Paladins trägt.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_04"); //Aber du bist von außerhalb, dir werden sie nicht so schnell misstrauen.
	AI_Output (self, other, "DIA_Andre_WhereThieves_08_05"); //Du könntest dich zuerst am Hafen umhören. Aber sei vorsichtig. Wenn die Leute dort mitbekommen, dass du für die Paladine arbeitest, erfährst du NICHTS!
	
	B_LogEntry (TOPIC_BecomeMIL,"Wenn ich die Diebesgilde ausfindig machen will, sollte ich mich vielleicht im Hafenviertel umhören.");
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
	description = "Was mache ich, wenn ich einen der Diebe gefunden habe?";
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
	AI_Output (other, self, "DIA_Andre_WhatToDo_15_00"); //Was mache ich, wenn ich einen der Diebe gefunden habe?
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_01"); //Wenn es sich um einen Handlanger handelt, einen Hehler oder einen kleinen Fisch, solltest du dich am Besten auf keinen Kampf einlassen.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_02"); //Komm lieber zu mir und erstatte mir Bericht. Ich werde mich dann darum kümmern, dass der Kerl hinter Gitter kommt.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_03"); //Bei einem offenen Kampf könnten die Stadtwachen einschreiten und du wirst keine Gelegenheit haben, ihnen zu erklären, was Sache ist.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_04"); //Außerdem gibt es für jeden schrägen Vogel, den du hinter Gitter bringst, ein Kopfgeld.
	AI_Output (self, other, "DIA_Andre_WhatToDo_08_05"); //Wenn du allerdings das Versteck der Drahtzieher findest - nun - dann wirst du vermutlich nicht um einen Kampf herumkommen.
	
	B_LogEntry (TOPIC_BecomeMIL,"Wenn ich einen Handlanger der Diebesgilde erwische, liefere ich am Besten an Lord Andre aus. Um die Diebesgilde zur Strecke zu bringen, muss ich ihr Versteck finden.");
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
	description	 = 	"Ich will das Kopfgeld für einen Verbrecher kassieren.";
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
	AI_Output (other, self, "DIA_Andre_Auslieferung_15_00"); //Ich will das Kopfgeld für einen Verbrecher kassieren.
	
	Info_ClearChoices (DIA_Andre_Auslieferung);
	
	Info_AddChoice (DIA_Andre_Auslieferung,"Ich komme später wieder (ZURÜCK)",DIA_Andre_Auslieferung_Back);
	
	// ------ Rengaru -----
	if (Rengaru_InKnast == TRUE)
	&& (Rengaru_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Rengaru hat den Händler Jora bestohlen.",DIA_Andre_Auslieferung_Rengaru);
	};
	// ------ Halvor ------
	if (Betrayal_Halvor == TRUE)
	&& (Halvor_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Halvor handelt mit gestohlenen Waren.",DIA_Andre_Auslieferung_Halvor);
	};
	// ------ Nagur ------
	if (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Nagur_Ausgeliefert == FALSE)
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Nagur hat Baltram's Boten getötet.",DIA_Andre_Auslieferung_Nagur);
	};
	// ------ Canthar -------
	if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (MIS_Canthars_KomproBrief_Day > (Wld_GetDay()-2))
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Canthar will Sarah aus dem Weg räumen.",DIA_Andre_Auslieferung_Canthar);
	};
	if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (Npc_HasItems (Sarah, ItWr_Canthars_KomproBrief_MIS) >= 1)
	&& (MIS_Canthars_KomproBrief_Day > (Wld_GetDay()-2))
	{
		Info_AddChoice (DIA_Andre_Auslieferung,"Sarah verkauft Waffen an Onar.",DIA_Andre_Auslieferung_Sarah);
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
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Rengaru_15_00"); //Rengaru hat den Händler Jora bestohlen. Er wollte abhauen, aber ich habe ihn erwischt.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Rengaru_08_01"); //Gut, meine Männer haben ihn schon aufgegriffen. Er wird die nächste Zeit niemanden mehr bestehlen!
	AI_Output (self, other, "DIA_Andre_Auslieferung_Rengaru_08_02"); //Hier hast du dein Geld.
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
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Halvor_15_00"); //Halvor ist ein Hehler. Er verkauft die Waren, die den Händlern von den Banditen gestohlen werden.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Halvor_08_01"); //Er steckt also dahinter. Meine Männer werden ihn sofort einsperren.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Halvor_08_02"); //Ich denke, er wird nicht viele Schwierigkeiten machen. Ich werde dir das Kopfgeld schon jetzt geben.
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
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Nagur_15_00"); //Nagur hat Baltrams Boten getötet. Er wollte mich als neuen Boten benutzen, um sich die Lieferung von Akil abzugreifen.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Nagur_08_01"); //Dieser Kerl wird seine gerechte Strafe bekommen. Ich werde ihn sofort einsperren lassen.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Nagur_08_02"); //Hier, nimm das Kopfgeld, das dir zusteht.
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
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Canthar_15_00"); //Der Händler Canthar will Sarah aus dem Weg räumen!
	AI_Output (self, other, "DIA_Andre_Auslieferung_Canthar_08_01"); //Sarah? Die Waffenhändlerin am Marktplatz?
	AI_Output (other,self , "DIA_Andre_Auslieferung_Canthar_15_02"); //Ich sollte Sarah einen Brief unterschieben, der sie belasten sollte, Onar mit Waffen zu beliefern.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Canthar_08_03"); //Verstehe. Das Kopfgeld für diesen Mistkerl zahle ich gerne. Er sitzt schon so gut wie hinter Gittern.
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
	
	AI_Output (other, self, "DIA_Andre_Auslieferung_Sarah_15_00"); //Sarah verkauft Waffen an Onar.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Sarah_08_01"); //Sarah? Die Waffenhändlerin am Marktplatz? Hast du dafür Beweise?
	AI_Output (other, self, "DIA_Andre_Auslieferung_Sarah_15_02"); //Sie hat einen Brief über Waffenlieferungen an ihn in der Tasche.
	AI_Output (self, other, "DIA_Andre_Auslieferung_Sarah_08_03"); //Damit wird sie nicht durchkommen. Ich werde sie verhaften lassen.
	
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
	description	 = 	"Wegen der Diebesgilde...";
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
	AI_Output (other, self, "DIA_Andre_DGRunning_15_00"); //Wegen der Diebesgilde...
	
	if (Andre_Diebesgilde_aufgeraeumt == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_08_01"); //Du kannst die Sache vergessen. Ich habe ein paar Männer runter in die Kanalisation geschickt.
		AI_Output (self, other, "DIA_Andre_DGRunning_08_02"); //Die Diebesgilde ist jetzt nur noch ein trauriges Kapitel in der Geschichte dieser Stadt.
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
	
	AI_Output (self, other, "DIA_Andre_DGRunning_08_03"); //Ja?
	
	Info_ClearChoices(DIA_Andre_DGRunning);
	Info_AddChoice(DIA_Andre_DGRunning, "Ich bin an der Sache dran...", DIA_Andre_DGRunning_BACK);
	
	if (Npc_IsDead(Cassia))
	&& (Npc_IsDead(Jesper))
	&& (Npc_IsDead(Ramirez))
	{
		Info_AddChoice(DIA_Andre_DGRunning, "Ich habe sie alle zur Strecke gebracht!", DIA_Andre_DGRunning_Success);
	};
	
	if ( (Cassia.aivar[AIV_TalkedToPlayer] == TRUE) || (Jesper.aivar[AIV_TalkedToPlayer] == TRUE) || (Ramirez.aivar[AIV_TalkedToPlayer] == TRUE) )
	&& (Diebesgilde_verraten == FALSE)
	{
		Info_AddChoice(DIA_Andre_DGRunning, "Ich habe das Versteck der Diebesgilde gefunden!", DIA_Andre_DGRunning_Verrat);
	};
};

func void DIA_Andre_DGRunning_BACK()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_BACK_15_00"); //Ich bin an der Sache dran ...
	if (Diebesgilde_verraten == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_BACK_08_01"); //Gut. Ich werde dir noch etwas Zeit geben, deine Mission zu erfüllen.
	}
	else
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_BACK_08_02"); //Gut! Halte mich auf dem Laufenden.
	};
	Info_ClearChoices(DIA_Andre_DGRunning);
};

func void DIA_Andre_DGRunning_Verrat()
{	
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_00"); //Ich habe das Versteck der Diebesgilde gefunden!
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_01"); //Wo?
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_02"); //In der Kanalisation unter der Stadt.
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_03"); //Was? Wir hatten die Kanalisation abgesperrt ...
	AI_Output (other, self, "DIA_Andre_DGRunning_Verrat_15_04"); //So wie's aussieht, hat sie das nicht davon abgehalten, sich da unten auszubreiten.
	AI_Output (self, other, "DIA_Andre_DGRunning_Verrat_08_05"); //Hast du die Verbrecher zur Strecke gebracht?
	Diebesgilde_verraten = TRUE;
	DG_gefunden = TRUE;
};

func void DIA_Andre_DGRunning_Success()
{
	AI_Output (other, self, "DIA_Andre_DGRunning_Success_15_00"); //Ich habe sie alle zur Strecke gebracht!
	AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_01"); //Damit hast du der Stadt einen großen Dienst erwiesen.
	DG_gefunden = TRUE;
	MIS_Andre_GuildOfThieves = LOG_SUCCESS;
	B_GivePlayerXP (XP_GuildOfThievesPlatt);
	
	if (MIS_CassiaKelche == LOG_RUNNING)
	{
		MIS_CassiaKelche = LOG_OBSOLETE;
	};
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_02"); //Wenn du noch Interesse an einem Posten bei der Miliz haben solltest, lass es mich wissen.
	}
	else if (other.guild == GIL_MIL) || (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_03"); //Du hast deine Pflicht erfüllt, wie es sich für einen Diener Innos' und einen Soldaten des Königs gehört.
	};
	
	AI_Output (self, other, "DIA_Andre_DGRunning_Success_08_04"); //Dir steht ein Kopfgeld für die Banditen zu. Hier, nimm es.
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
	description	 = 	"Ich bin bereit, mich der Miliz anzuschließen!";
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
	AI_Output (other, self, "DIA_Andre_JOIN_15_00"); //Ich bin bereit, mich der Miliz anzuschließen!
	
	//ADDON
	if (Andre_Knows_MartinEmpfehlung == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Andre_JOIN_08_00"); //Martin, der Proviantmeister, bürgt für dich und hat dich sogar empfohlen. Das alleine genügt mir schon.
	}
	//ADDON
	else if (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
	&& (Player_IsApprentice == APP_NONE)
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_01"); //Ich werde mich an meinen Teil der Abmachung halten, und dich in die Miliz aufnehmen, auch ohne dass du Bürger der Stadt bist.
		AI_Output (self, other, "DIA_Andre_JOIN_08_02"); //Aber häng die Sache nicht an die große Glocke! Je weniger Leute von dieser Ausnahme erfahren, um so weniger muss ich mich hinterher dafür rechtfertigen.
	}
	else if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_03"); //Dann bist du also Bürger von Khorinis?
		
		if (Player_IsApprentice == APP_Harad)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_04"); //Der Schmied hat mich als Lehrling aufgenommen.
			AI_Output (self, other, "DIA_Andre_JOIN_08_05"); //Harad? Ich kenne ihn. Er arbeitet für uns. Er ist ein guter Mann.
		};
		
		if (Player_IsApprentice == APP_Constantino)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_06"); //Ich bin der Lehrling des Alchemisten!
			AI_Output (self, other, "DIA_Andre_JOIN_08_07"); //Wir haben nicht gerade viele Gelehrte in der Miliz. Vielleicht können deine Fähigkeiten uns ja noch einmal von großem Nutzen sein.
			AI_Output (self, other, "DIA_Andre_JOIN_08_08"); //Ich weiß nicht viel über den Alchemisten. Aber die Leute erzählen, er sei ein ehrenwerter Mann.
		};
		
		if (Player_IsApprentice == APP_Bosper)
		{
			AI_Output (other, self, "DIA_Andre_JOIN_15_09"); //Bosper der Bogner hat mich als seinen Lehrling aufgenommen.
			AI_Output (self, other, "DIA_Andre_JOIN_08_10"); //Dann versteht du also was vom Wildnisleben? Das ist gut, denn es gibt bei der Miliz nicht nur Aufgaben innerhalb der Stadtmauern.
			AI_Output (self, other, "DIA_Andre_JOIN_08_11"); //Wir können auch Leute, die sich in der Wildnis auskennen, gut gebrauchen.
			AI_Output (self, other, "DIA_Andre_JOIN_08_12"); //Und der Bogner ist ein angesehener Mann in der Stadt.
		};
		
		AI_Output (self, other, "DIA_Andre_JOIN_08_13"); //Wenn er sich für dich verbürgt, steht deiner Aufnahme bei der Miliz nichts mehr im Wege.
		
		// ------- Außerdem noch GuildOfThieves ------
		if (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Andre_JOIN_08_14"); //Außerdem hast du uns die Diebesgilde vom Hals geschafft. Alleine deswegen hätte ich dich schon genommen.
		};
	}
	else //Player_IsApprentice == APP_NONE
	{
		AI_Output (self, other, "DIA_Andre_JOIN_08_15"); //Mag sein - aber du bist noch kein Bürger dieser Stadt und ich habe meine Befehle.
		return;
	};
		
	AI_Output (self, other, "DIA_Andre_JOIN_08_16"); //Du kannst dich uns anschließen, wenn du willst. Aber deine Entscheidung wird endgültig sein.
	AI_Output (self, other, "DIA_Andre_JOIN_08_17"); //Wenn du einmal die Rüstung der Miliz trägst, kannst du sie nicht einfach ausziehen und gehörst nicht mehr dazu.
	AI_Output (self, other, "DIA_Andre_JOIN_08_18"); //Bist du bereit, mit uns gemeinsam für Innos und den König zu kämpfen?
	
	Info_ClearChoices (DIA_Andre_JOIN);
	Info_AddChoice (DIA_Andre_JOIN,"Ich bin mir noch nicht sicher...",DIA_Andre_JOIN_No);
	Info_AddChoice (DIA_Andre_JOIN,"Ich bin bereit!",DIA_Andre_JOIN_Yes);
};
	
func void DIA_Andre_JOIN_Yes()
{
	AI_Output (other, self, "DIA_Andre_JOIN_Yes_15_00"); //Ich bin bereit!
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_01"); //Dann soll es so sein. Willkommen bei der Miliz.
	
	Npc_SetTrueGuild (other, GIL_MIL);
	other.guild	= GIL_MIL;
	Snd_Play ("LEVELUP");
	
	Npc_ExchangeRoutine (Lothar, "START");
	
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_02"); //Hier hast du deine Rüstung.
	B_GiveInvItems (self,other, ITAR_MIL_L,1);
	AI_Output (self, other, "DIA_Andre_JOIN_Yes_08_03"); //Trage sie mit Stolz und Würde.
	
	SLD_Aufnahme = LOG_OBSOLETE;
	KDF_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_SUCCESS;
	B_GivePlayerXP (XP_BecomeMiliz);
	
	Info_ClearChoices (DIA_Andre_JOIN);
};

func void DIA_Andre_JOIN_No()
{
	AI_Output (other, self, "DIA_Andre_JOIN_No_15_00"); //Ich bin mir noch nicht sicher ...
	AI_Output (self, other, "DIA_Andre_JOIN_No_08_01"); //Solange deine Zweifel deiner Entscheidung im Wege stehen, kann ich dich nicht bei der Miliz aufnehmen.
	
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
	description	 = 	"Kann ich jetzt endlich zu Lord Hagen?";
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
	AI_Output (other, self, "DIA_Andre_LORDHAGEN_15_00"); //Kann ich jetzt endlich zu Lord Hagen?
	AI_Output (self, other, "DIA_Andre_LORDHAGEN_08_01"); //Du stehst jetzt im Dienst der Paladine. Sie werden dich vorlassen. Aber du solltest ihm besser etwas sehr Wichtiges zu sagen haben.
	AI_Output (other, self, "DIA_Andre_LORDHAGEN_15_02"); //Keine Angst, das habe ich ...
	AI_Output (self, other, "DIA_Andre_LORDHAGEN_08_03"); //Denk daran, dass du vor den obersten Paladin trittst. Benimm dich entsprechend. Du vertrittst jetzt nicht nur dich, sondern die gesamte Miliz.
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
	description	 = 	"Bekomme ich auch eine Waffe?";
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
	AI_Output (other, self, "DIA_Andre_Waffe_15_00"); //Bekomme ich auch eine Waffe?
	AI_Output (self, other, "DIA_Andre_Waffe_08_01"); //Natürlich. Peck kümmert sich für gewöhnlich darum. Dabei fällt mir ein, ich habe ihn schon lange nicht mehr gesehen.
	AI_Output (self, other, "DIA_Andre_Waffe_08_02"); //Finde heraus, wo er steckt und bringe ihn her. Dann soll er dir eine Waffe geben.
	AI_Output (self, other, "DIA_Andre_Waffe_08_03"); //Und wenn du schlafen willst, dann kannst du dich in eins der freien Betten in der Schlafbaracke legen.
	
	MIS_Andre_Peck = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_Peck,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Peck,LOG_RUNNING);
	B_LogEntry (TOPIC_Peck,"Peck ist irgendwo in der Stadt. Wenn ich ihn zurück zur Kaserne bringe, kann ich mir eine Waffe von ihm holen.");
	
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
	description	 = 	"Ich habe Peck ausfindig gemacht";
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
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_15_00"); //Ich habe Peck ausfindig gemacht.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_08_01"); //Ja, er ist schon wieder an seinem Posten und geht seiner Pflicht nach. Wo hast du ihn getroffen?

	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
	Info_AddChoice 		(DIA_Andre_FOUND_PECK,"Er ist mir über'n Weg gelaufen ...",DIA_Andre_FOUND_PECK_SOMEWHERE);
	Info_AddChoice 		(DIA_Andre_FOUND_PECK,"In der 'roten Laterne'...",DIA_Andre_FOUND_PECK_REDLIGHT);

};
FUNC VOID DIA_Andre_FOUND_PECK_SOMEWHERE()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_SOMEWHERE_15_00"); //Er ist mir in der Stadt über'n Weg gelaufen.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_SOMEWHERE_08_01"); //Okay, dann geh zu ihm und lass dir eine Waffe geben.
	
	MIS_Andre_Peck = LOG_OBSOLETE;// wird hier benutzt, um Unterscheidung bei Waffenausgabe zu haben, aber Mission ist trotzdem geschafft! M.F.
	B_GivePlayerXP 		(XP_FoundPeck);
	Info_ClearChoices 	(DIA_Andre_FOUND_PECK);
};
FUNC VOID DIA_Andre_FOUND_PECK_REDLIGHT()
{
	AI_Output (other, self, "DIA_Andre_FOUND_PECK_REDLIGHT_15_00"); //Er war in der 'Roten Laterne'.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_REDLIGHT_08_01"); //So, er treibt sich also bei den Mädels rum, statt seiner Pflicht nachzugehen.
	AI_Output (self, other, "DIA_Andre_FOUND_PECK_REDLIGHT_08_02"); //Ich glaube, ich werde noch einmal ein paar Worte mit ihm wechseln.
	
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
	AI_Output (self, other,"DIA_Andre_Sold_08_00");//Hier ist dein Sold.
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
	description	 = 	"Hast du eine Aufgabe für mich?";
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
	AI_Output (other, self, "DIA_Andre_FIRSTMISSION_15_00"); //Hast du eine Aufgabe für mich?
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_01"); //In letzter Zeit nimmt der Verkauf von Sumpfkraut in der Stadt zu.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_02"); //Wir können es uns nicht leisten, dass sich das Zeug verbreitet.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_03"); //Sonst fangen hier alle noch an zu rauchen und sind nicht mehr in der Lage zu arbeiten, geschweige denn, eine Waffe zu halten.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_04"); //Vor allem jetzt, da die Gefahr durch einen möglichen Angriff der Orks oder Söldner besteht.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_05"); //Ich vermute, dass die Söldner dahinter stecken. Ich wette, sie bringen das Zeug in die Stadt.
	AI_Output (other, self, "DIA_Andre_FIRSTMISSION_15_06"); //Was ist zu tun?
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_07"); //Mortis, einer unserer Männer, hat in der Hafenkneipe aufgeschnappt, dass irgendwo am Hafen ein Paket mit Sumpfkraut angekommen ist.
	AI_Output (self, other, "DIA_Andre_FIRSTMISSION_08_08"); //Sieh dich dort mal um und bringe mir das Paket.
	
	MIS_ANDRE_WAREHOUSE = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_WAREHOUSE,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_WAREHOUSE,LOG_RUNNING);
	B_LogEntry (TOPIC_WAREHOUSE,"Im Hafen ist ein Paket mit Sumpfkraut angekommen. Das hat Mortis dort in der Kneipe ausgeschnappt. Ich soll das Paket finden und zu Lord Andre bringen.");
	
	
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
	description	 = 	"Wegen des Pakets...";
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
	
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_15_00"); //Wegen des Pakets...
	AI_Output (self, other, "DIA_Andre_FOUND_STUFF_08_01"); //Hast du es gefunden?
	
	if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
	|| (MIS_Cipher_Paket == LOG_SUCCESS)
	{
		Info_ClearChoices (DIA_Andre_FOUND_STUFF);
	
		if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
		{
			Info_AddChoice (DIA_Andre_FOUND_STUFF,"Ja, hier ist es.",DIA_Andre_FOUND_STUFF_Ja);	
		};
		
		Info_AddChoice (DIA_Andre_FOUND_STUFF,"Ich habe es in's Hafenbecken geschmissen.",DIA_Andre_FOUND_STUFF_Becken);
	}
	else
	{
		AI_Output	(other, self, "DIA_Andre_FOUND_STUFF_15_02"); //Bisher noch nicht.
	};
};
FUNC VOID DIA_Andre_FOUND_STUFF_Ja()
{
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_Ja_15_00"); //Ja, hier ist es.
	B_GiveInvItems (other, self,ItMi_HerbPaket,1);
	AI_Output	(self, other, "DIA_Andre_FOUND_STUFF_Ja_08_01"); //Gute Arbeit. Das Kraut werden wir sicher verwahren.
	B_AndreSold ();
	
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	MIS_Cipher_Paket = LOG_FAILED;
	B_GivePlayerXP (XP_Warehouse_Super*2);
	Info_ClearChoices 	(DIA_Andre_FOUND_STUFF);
	
};
FUNC VOID DIA_Andre_FOUND_STUFF_Becken()
{
	AI_Output (other, self, "DIA_Andre_FOUND_STUFF_Becken_15_00"); //Ich habe es ins Hafenbecken geschmissen.
	AI_Output (self, other, "DIA_Andre_FOUND_STUFF_Becken_08_01"); //So? Nun gut, Hauptsache, es kann nicht mehr in falsche Hände geraten.
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
	description	 = 	"Hast du noch einen Job für mich?";
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
	AI_Output (other, self, "DIA_Andre_FIND_DEALER_15_00"); //Hast du noch einen Job für mich?
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_01"); //Du hast das Paket mit dem Sumpfkraut aus dem Verkehr gezogen - gut.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_02"); //Aber ich will wissen, wer das Zeug unter die Leute bringt.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_03"); //Es muss irgendjemand im Hafenviertel sein.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_04"); //Würde jemand von außerhalb regelmäßig in die Stadt kommen, wäre er längst aufgefallen.
	AI_Output (other, self, "DIA_Andre_FIND_DEALER_15_05"); //Was genau soll ich tun?
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_06"); //Finde den Verkäufer und bringe ihn dazu, dir Kraut zu verkaufen. Das wird nicht einfach, aber sonst können wir ihn nicht festnehmen.
	AI_Output (self, other, "DIA_Andre_FIND_DEALER_08_07"); //Sprich mit Mortis, er kennt sich im Hafenviertel aus. Vielleicht kann er dir helfen.
	
	
	MIS_Andre_REDLIGHT = LOG_RUNNING;
	B_StartOtherRoutine (Nadja, "SMOKE");
	
	Log_CreateTopic (TOPIC_REDLIGHT,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_REDLIGHT,LOG_RUNNING);
	B_LogEntry (TOPIC_REDLIGHT,"Ich soll den Kerl finden, der das Sumpfkraut im Hafenviertel verkauft. Ich muss ihn dazu kriegen, das er mir Kraut verkauft. Mortis kann mir in dieser Sache weiterhelfen.");
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
	description	 = 	"Wegen des Krauts ...";
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
	AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_00"); //Wegen des Krauts...
	
	if (Npc_IsDead (Borka) == TRUE)
	|| (Undercover_Failed == TRUE)
	{
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_01"); //Ich glaube nicht, dass wir jetzt noch irgendwas im Hafenviertel erfahren werden.
		
		if  (Npc_IsDead (Borka) == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_02"); //Nicht nach dem Tod dieses Türstehers.
		};
		
		if (Nadja_Victim == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_03"); //Dieses Mädchen aus der roten Laterne, Nadja, sie ist tot. War wohl ein schrecklicher Unfall.
			B_RemoveNpc (Nadja);
		};
		if (Undercover_Failed == TRUE)
		{
			AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_04"); //Du warst nicht unauffällig genug.
		};
		MIS_Andre_REDLIGHT = LOG_FAILED;
		B_CheckLog();
	}
	else if  (Borka_Deal == 2)
	{
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_05"); //Ich weiß, wer das Kraut in der Stadt verkauft. Borka, der Türsteher der Roten Laterne.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_06"); //Tatsächlich? Haben wir dafür Beweise?
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_07"); //Er hat mir Sumpfkraut verkauft.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_08"); //Gut, das genügt uns. Ich werde ihn sofort verhaften lassen.
		
		B_StartOtherRoutine (Borka, "PRISON");
		MIS_Andre_REDLIGHT = LOG_SUCCESS;
		B_GivePlayerXP (XP_Redlight);
		B_AndreSold ();
	}
	else 
	{
		AI_Output (other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_09"); //... ich bin noch dran.
		AI_Output (self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_10"); //Gut, denk daran, du musst den Kerl dazu bringen, dass er mit dir ein Geschäft macht.
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
	description	 = 	"Hast du eine andere Aufgabe für mich?";
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
	AI_Output (other, self, "DIA_Andre_HILFBAUERLOBART_15_00"); //Hast du eine andere Aufgabe für mich?
	AI_Output (self, other, "DIA_Andre_HILFBAUERLOBART_08_01"); //Lobart, der Rübenbauer, hat Probleme auf seinen Feldern.
	AI_Output (self, other, "DIA_Andre_HILFBAUERLOBART_08_02"); //Wenn wir ihm helfen, wird das sein Verhältnis zur Stadt festigen. Also geh zu ihm und schau, was da los ist.

	
	Log_CreateTopic (TOPIC_Feldraeuber, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Feldraeuber, LOG_RUNNING);
	B_LogEntry (TOPIC_Feldraeuber,"Andre hat mich zu Lobarts Bauernhof geschickt. Ich soll Lobart helfen, seinen Hof wieder in den Griff zu kriegen."); 
	
	
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
	description	 = 	"Ich habe Lobart geholfen.";
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
	AI_Output (other, self, "DIA_Andre_LOBART_SUCCESS_15_00"); //Ich habe Lobart geholfen.
	AI_Output (self, other, "DIA_Andre_LOBART_SUCCESS_08_01"); //Ausgezeichnet. Wenn Lobart zufrieden ist, dann wird er seine Rüben auch weiterhin an die Stadt verkaufen.
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

	description	= "Was ist mit den vermissten Leuten?";
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
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople_15_00"); //Was ist mit den vermissten Leuten?
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_01"); //Was soll damit sein?
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople_15_02"); //Wollen wir nicht versuchen, sie zu finden?
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_03"); //Ich habe von Lord Hagen den Befehl erhalten, die Stadt und die umliegenden Höfe zu schützen.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_04"); //Das bedeutet, wir werden uns um die Leute kümmern, die noch HIER sind.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_05"); //Die Miliz patrouilliert nachts auf den Straßen. Mehr kann ich nicht tun.
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople_08_06"); //Und DU wirst dich um die Aufgaben kümmern, die ich dir gebe, verstanden?
	
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

	description	= "Wegen der vermißten Leute...";
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
	AI_Output (other, self, "DIA_Addon_Andre_MissingPeople2_15_00"); //Wegen der vermissten Leute ...
	AI_Output (self, other, "DIA_Addon_Andre_MissingPeople2_08_01"); //Hör bloß auf mit DER Geschichte. Ich habe andere Sorgen.
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

	description	 = 	"Ich habe einige der verschwundenen Leute retten können.";
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
	AI_Output	(other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_00"); //Ich habe einige der verschwundenen Leute retten können.
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_01"); //Ich hatte mich schon gefragt, wo du dich die ganze Zeit rumgetrieben hast!
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_02"); //Du bist Angehöriger der Miliz! Du hattest keinen Befehl zu so einer Aktion!
		AI_Output (other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_03"); //Aber ...
	};	
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_04"); //Wie viele Leute hast du gefunden?
	AI_Output (other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_05"); //Alle, die noch am Leben waren ...
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_06"); //Alle?! Ich ... Äh ...
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_07"); //Ich bin stolz auf dich! Ich bin froh, dich bei uns aufgenommen zu haben.
		B_AndreSold ();
	};
	AI_Output (self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_08"); //Das war eine große Tat.

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
	AI_Output (self ,other,"DIA_Andre_Add_08_11"); //Geh am besten direkt zu ihm.
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
	description	 = 	"Ich war im Minental und habe Drachen gesehen!";
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
	
	AI_Output (other, self,"DIA_Andre_Add_15_13"); //Ich war im Minental und habe Drachen gesehen!
	if (Npc_HasItems (hero, ItWr_PaladinLetter_MIS) > 0)
	{
		AI_Output (other, self,"DIA_Andre_Add_15_14"); //Ich habe einen Brief von Kommandant Garond, der alles bestätigt, was ich gesagt habe.
	};
	AI_Output (self ,other,"DIA_Andre_Add_08_10"); //Das wird Lord Hagen interessieren!
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
	description	 = 	"Was ist mit Bennet, dem Schmied?";
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
	AI_Output (other, self, "DIA_Andre_BennetInPrison_15_00"); //Was ist mit Bennet, dem Schmied?
	AI_Output (self, other, "DIA_Andre_BennetInPrison_08_01"); //Du meinst den Söldner? Der sitzt im Knast, wo er hingehört.
	AI_Output (other,self ,"DIA_Andre_BennetInPrison_Talk_15_00"); //Kann ich mit ihm sprechen?
	AI_Output (self ,other,"DIA_Andre_BennetInPrison_Talk_08_01"); //Klar, geh einfach rein. Aber wenn du versuchst, ihm zur Flucht zu verhelfen, bist du dran.
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
	description	 = 	"Ich glaube, Cornelius lügt.";
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
	AI_Output			(other, self, "DIA_Andre_Cornelius_Liar_15_00"); //Ich glaube, Cornelius lügt.
	AI_Output			(self, other, "DIA_Andre_Cornelius_Liar_08_01"); //Bist du sicher?
	
	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
	Info_AddChoice (DIA_Andre_Cornelius_Liar,"Nein",DIA_Andre_Cornelius_Liar_No);  
	Info_AddChoice (DIA_Andre_Cornelius_Liar,"Ja",DIA_Andre_Cornelius_Liar_Yes);
};

FUNC VOID DIA_Andre_Cornelius_Liar_No()
{
	AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_No_15_00"); //Nein.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_01"); //Dann solltest du deinen Verdacht nicht so laut aussprechen.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_02"); //Cornelius ist ein einflussreicher Mann. Wenn er will, kann er dir dein Leben zur Hölle machen.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_No_08_03"); //Solange du keine Beweise hast, kann ich dir nicht helfen.

	Info_ClearChoices (DIA_Andre_Cornelius_Liar);
};

FUNC VOID DIA_Andre_Cornelius_Liar_Yes()
{
	AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_00"); //Ja.
	AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_01"); //Was für Beweise hast du?
	
	if (Cornelius_IsLiar == TRUE)
	{
		AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_02"); //Ich habe sein Tagebuch gelesen! Er wurde geschmiert, es war alles gelogen.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_03"); //Wenn das wirklich stimmt, musst du sofort zu Lord Hagen gehen.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_04"); //Zeige ihm das Tagebuch. Er wird sich dann um alles kümmern.
	}
	else
	{
		AI_Output (other,self ,"DIA_Andre_Cornelius_Liar_Yes_15_05"); //Ähhm, nun, ich glaube ...
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_06"); //Ich brauche Beweise, keine Vermutungen. Besorge die Beweise, dann kann ich auch etwas für dich tun.
		AI_Output (self ,other,"DIA_Andre_Cornelius_Liar_Yes_08_07"); //Bis dahin solltest du dir ganz genau überlegen, was du sagst.
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
	AI_Output (self, other, "DIA_Andre_Paladin_08_00"); //Du bist jetzt also ein Paladin! Gratuliere!
	AI_Output (self, other, "DIA_Andre_Paladin_08_01"); //Ich hab mir von vorneherein gedacht, dass du nicht lange bei der Miliz bleiben würdest.
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
	description	 = "Wie ist die Lage in der Stadt?";
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
	AI_Output (other, self, "DIA_Andre_PERM_15_00"); //Wie ist die Lage in der Stadt?
	
	AI_Output (self, other, "DIA_Andre_PERM_08_01"); //Alles unter Kontrolle.
	if (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Andre_PERM_08_02"); //Erfülle deine Aufträge.
	};
	
	if (other.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Andre_PERM_08_03"); //Du unterstehst ab jetzt direkt Lord Hagen. Wende dich an ihn.
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
	description	 = 	"Ich habe alle Drachen im Minental getötet!";
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
	AI_Output (other, self,"DIA_Andre_Add_15_15"); //Ich habe alle Drachen im Minental getötet!
	AI_Output (self ,other,"DIA_Andre_Add_08_08"); //Wenn das wahr ist, mußt du Lord Hagen davon berichten.
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
	description	 = 	"Die Burg im Minental wurde von den Orks gestürmt!";
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
	AI_Output (other, self,"DIA_Andre_Add_15_16"); //Die Burg im Minental wurde von den Orks gestürmt!
	AI_Output (self ,other,"DIA_Andre_Add_08_09"); //Nein! Lord Hagen muß davon erfahren.
	B_Andre_GotoLordHagen();
};





















