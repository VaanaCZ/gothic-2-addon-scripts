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
	AI_Output (self ,other, "DIA_Lee_Add_04_05"); //Ah. Gut, daß du kommst.
	AI_Output (other, self, "DIA_Lee_Add_15_06"); //Was gibt's?
	AI_Output (self ,other, "DIA_Lee_Add_04_07"); //Das hier hab ich in der alten Kapelle gefunden.
	B_GiveInvItems (self, other, ItRu_TeleportFarm, 1);
	AI_Output (self ,other, "DIA_Lee_Add_04_08"); //Es ist eine magische Rune. Ich glaube, sie teleportiert dich direkt hierhin zum Hof.
	AI_Output (self ,other, "DIA_Lee_Add_04_09"); //Ich dachte, du könntest sie vielleicht gebrauchen.
	
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
	
	
	AI_Output (self, other, "DIA_Lee_PMSchulden_04_00"); //Bist du gekommen, um das Geld für Onar zu bringen?

	if (B_GetTotalPetzCounter(self) > Lee_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_01"); //Ich hatte dir doch gesagt, du sollst hier keine Dummheiten mehr machen.
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_02"); //Onar hat mitbekommen, dass du mittlerweile noch mehr auf dem Kerbholz hast.
		if (Lee_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_03"); //Dementsprechend will er jetzt mehr Geld.
			AI_Output (other, self, "DIA_Lee_PMAdd_15_00"); //Wieviel?
			
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
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_04"); //Ich hatte dich für klüger gehalten.
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Lee_LastPetzCrime)
	{
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_05"); //Dann habe ich gute Nachrichten für dich.
		
		if (Lee_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_06"); //Plötzlich gibt es niemanden mehr, der den Mord gesehen hat.
		};
		
		if (Lee_LastPetzCrime == CRIME_THEFT)
		|| ( (Lee_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_07"); //Keiner der Leute will mehr bezeugen, dich bei einem Diebstahl gesehen zu haben.
		};
		
		if (Lee_LastPetzCrime == CRIME_ATTACK)
		|| ( (Lee_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_08"); //Es ist niemand mehr da der GESEHEN hat, wie du einen der Bauern verprügelt hast.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_09"); //Anscheinend haben sich alle Anklagen gegen dich in Wohlgefallen aufgelöst.
		};
		
		AI_Output (self, other, "DIA_Lee_PMSchulden_04_10"); //Das ist auch 'ne Art, mit solchen Problemen umzugehen.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_11"); //Zahlen musst du jedenfalls nichts mehr.
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_12"); //Pass in Zukunft besser auf.
	
			Lee_Schulden			= 0;
			Lee_LastPetzCounter 	= 0;
			Lee_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_13"); //Damit eins klar ist: Deine Strafe musst du trotzdem in voller Höhe bezahlen.
			B_Say_Gold (self, other, Lee_Schulden);
			AI_Output (self, other, "DIA_Lee_PMSchulden_04_14"); //Also, was ist?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Lee_PMSchulden);
		Info_ClearChoices  	(DIA_Lee_PETZMASTER);
		Info_AddChoice		(DIA_Lee_PMSchulden,"Ich habe nicht genug Gold!",DIA_Lee_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Lee_PMSchulden,"Wieviel war es nochmal?",DIA_Lee_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
		{
			Info_AddChoice 	(DIA_Lee_PMSchulden,"Ich will die Strafe zahlen.",DIA_Lee_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Lee_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Lee_PMSchulden_HowMuchAgain_15_00"); //Wie viel war es noch mal?
	B_Say_Gold (self, other, Lee_Schulden);

	Info_ClearChoices  	(DIA_Lee_PMSchulden);
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_AddChoice		(DIA_Lee_PMSchulden,"Ich habe nicht genug Gold!",DIA_Lee_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Lee_PMSchulden,"Wieviel war es nochmal?",DIA_Lee_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice 	(DIA_Lee_PMSchulden,"Ich will die Strafe zahlen.",DIA_Lee_PETZMASTER_PayNow);
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
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_00"); //Wer zum Teufel hat DICH denn hier rein- (überrascht) - DU bist der Neue, der hier Ärger gemacht hat?
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_01"); //Ich hab von Gorn gehört, dass du lebst, aber dass du hierher kommen würdest ... wie auch immer ...
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_02"); //Gut, dass du zu mir kommst, bevor alles noch schlimmer für dich wird..
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_03"); //Die Söldner sind harte Jungs, und die Bauern hier sind auch nicht gerade zimperlich, aber du kannst nicht einfach Leute umbringen.
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Lee_Schulden = Lee_Schulden + 500;						//PLUS Mörder-Malus
		if ((PETZCOUNTER_Farm_Theft + PETZCOUNTER_Farm_Attack + PETZCOUNTER_Farm_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_04"); //Ganz zu schweigen von den anderen Sachen, die du hier abgezogen hast.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_05"); //Ich kann dir helfen, aus der Sache wieder sauber rauszukommen.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_06"); //Allerdings wird das nicht billig. Onar ist ein gieriger Mann, und nur wenn ER beide Augen zudrückt, ist die Sache vergessen.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_07"); //Gut, dass du kommst! Ich hab gehört, du hättest hier was gestohlen.
		if (PETZCOUNTER_Farm_Attack > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_08"); //Und dich mit den Bauern geprügelt.
		};
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_09"); //UND ein paar Schafe geschlachtet.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_10"); //So was kannst du hier nicht bringen. Onar besteht in solchen Fällen darauf, dass ich die Täter zur Rechenschaft ziehe.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_11"); //Das bedeutet: Du zahlst, und er steckt sich die Kohle ein - aber damit hat sich die Sache dann auch.
		
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_12"); //Wenn du dich mit den Söldnern auf Duelle einlässt, ist das eine Sache ...
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_13"); //Aber wenn du die Bauern verprügelst, rennen sie direkt zu Onar. Und der erwartet, dass ich etwas unternehme.
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Lee_PETZMASTER_04_14"); //Ganz zu schweigen davon, dass er nicht sehr erbaut ist, wenn man seine Schafe umbringt.
		};
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_15"); //Du wirst eine Strafe zahlen müssen. Onar steckt sich das Geld in der Regel selber ein - aber es ist der einzige Weg, die Sache zu bereinigen.
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_16"); //Onar erwartet von mir, dass ich seinen Hof schütze. Das gilt auch für seine Schafe.
		AI_Output (self, other, "DIA_Lee_PETZMASTER_04_17"); //Du wirst ihm eine Entschädigung zahlen müssen!
		
		Lee_Schulden = 100;
	};
	
	AI_Output (other, self, "DIA_Lee_PETZMASTER_15_18"); //Wie viel?
	
	if (Lee_Schulden > 1000)	{	Lee_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Lee_Schulden);
	
	Info_ClearChoices  	(DIA_Lee_PMSchulden);
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_AddChoice		(DIA_Lee_PETZMASTER,"Ich habe nicht genug Gold!",DIA_Lee_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice 	(DIA_Lee_PETZMASTER,"Ich will die Strafe zahlen.",DIA_Lee_PETZMASTER_PayNow);
	};
};

func void DIA_Lee_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Lee_PETZMASTER_PayNow_15_00"); //Ich will die Strafe zahlen!
	B_GiveInvItems (other, self, itmi_gold, Lee_Schulden);
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayNow_04_01"); //Gut! Ich werde dafür sorgen, dass Onar das Geld bekommt. Du kannst die Sache als vergessen betrachten.

	B_GrantAbsolution (LOC_FARM);
	
	Lee_Schulden			= 0;
	Lee_LastPetzCounter 	= 0;
	Lee_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Lee_PETZMASTER);
	Info_ClearChoices  	(DIA_Lee_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Lee_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Lee_PETZMASTER_PayLater_15_00"); //Ich habe nicht genug Gold!
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayLater_04_01"); //Dann sieh zu, dass du dir es so schnell wie möglich beschaffst.
	AI_Output (self, other, "DIA_Lee_PETZMASTER_PayLater_04_02"); //Aber denk bloß nicht daran, es dir hier auf dem Hof zusammenzuklauen. Wenn du erwischt wirst, wird die Sache nur noch schlimmer für dich.
	
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
	AI_Output (self, other, "DIA_Lee_Hallo_04_00"); //Wer zum Teufel hat DICH denn hier rein- (überrascht) Was machst du denn hier? Ich dachte, du wärst tot!
	AI_Output (other, self, "DIA_Lee_Hallo_15_01"); //Wie kommst du denn darauf?
	AI_Output (self, other, "DIA_Lee_Hallo_04_02"); //Gorn hat mir erzählt, dass du es warst, der die Barriere zum Einsturz gebracht hat.
	AI_Output (other, self, "DIA_Lee_Hallo_15_03"); //Das war ich auch.
	AI_Output (self, other, "DIA_Lee_Hallo_04_04"); //Ich hätte nicht gedacht, dass ein Mann so etwas überleben kann. Was treibt dich her? Du bist doch nicht ohne Grund hier ...
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
	description = "Ich muss dringend mit den Paladinen in der Stadt reden,...";
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
	AI_Output (other, self, "DIA_Lee_Paladine_15_00"); //Ich muss dringend mit den Paladinen in der Stadt reden, kannst du mir helfen, zu ihnen zu kommen?
	AI_Output (self, other, "DIA_Lee_Paladine_04_01"); //(misstrauisch) Was willst du von den Paladinen?
	AI_Output (other, self, "DIA_Lee_Paladine_15_02"); //Das ist eine lange Geschichte ...
	AI_Output (self, other, "DIA_Lee_Paladine_04_03"); //Ich habe Zeit.
	AI_Output (other, self, "DIA_Lee_Paladine_15_04"); //(seufzt) Xardas hat mich auf eine Mission geschickt. Er will, dass ich ein mächtiges Amulett beschaffe, das Auge Innos'.
	AI_Output (self, other, "DIA_Lee_Paladine_04_05"); //Du bist also noch immer mit diesem Dämonenbeschwörer im Bunde. Verstehe. Und die Paladine haben dieses Amulett?
	AI_Output (other, self, "DIA_Lee_Paladine_15_06"); //So viel ich weiß, ja.
	AI_Output (self, other, "DIA_Lee_Paladine_04_07"); //Ich kann dir helfen, zu den Paladinen zu kommen. Allerdings erst, wenn du einer von uns bist.
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
	description = "Wie kannst du mir helfen, zu den Paladinen zu kommen?";
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
	AI_Output (other, self, "DIA_Lee_PaladineHOW_15_00"); //Wie kannst du mir helfen, zu den Paladinen zu kommen?
	AI_Output (self, other, "DIA_Lee_PaladineHOW_04_01"); //Vertrau mir. Ich habe einen Plan. Und ich glaube, du bist genau der Richtige dafür ...
	AI_Output (self, other, "DIA_Lee_PaladineHOW_04_02"); //Ich bringe dich zu den Paladinen und du tust mir dafür einen Gefallen. Aber zuerst schließ dich uns an!
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
	description = "Was genau tust du hier?";
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
	AI_Output (other, self, "DIA_Lee_LeesPlan_15_00"); //Was genau tust du hier?
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_01"); //Ganz einfach: Ich werde dafür sorgen, dass wir alle von dieser Insel wegkommen.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_02"); //Onar hat uns angeheuert, damit wir seinen Hof verteidigen, und genau das tun wir auch.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_03"); //Aber unser Lohn ist mehr als nur unser Sold. Indem wir den Bauern helfen, schneiden wir die Stadt von ihrer Versorgung ab.
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_04"); //Und je weniger die Paladine zu essen haben, um so eher werden sie zuhören, wenn ich ihnen schließlich ein Friedensangebot mache.

	if ((hero.guild == GIL_MIL)||(hero.guild == GIL_PAL))
	{
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_05"); //Zu dumm, dass du ausgerechnet ihrem Verein beigetreten bist.
	};

	AI_Output (other, self, "DIA_Lee_LeesPlan_15_06"); //Wie soll dein Angebot aussehen?
	AI_Output (self, other, "DIA_Lee_LeesPlan_04_07"); //Im Wesentlichen geht es um unsere Begnadigung und um freie Überfahrt zum Festland. Du wirst mehr erfahren, wenn es so weit ist.
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
	description = "Ich will mich euch anschließen! ";
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
	AI_Output (other, self, "DIA_Lee_WannaJoin_15_00"); //Ich will mich euch anschließen!
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_01"); //Ich hatte gehofft, dass du das sagst! Ich kann hier jeden fähigen Mann gut gebrauchen.
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_02"); //Die letzten Söldner, die ich aufgenommen habe, machen nichts als Ärger!
	AI_Output (self, other, "DIA_Lee_WannaJoin_04_03"); //Du kannst im Grunde direkt anfangen. Na ja, vorher müssen noch ein, zwei Dinge geklärt werden, aber das ist halb so wild ...
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
	description = "Was muss ich 'klären', bevor ich bei euch mitmachen kann?";
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
	AI_Output (other, self, "DIA_Lee_ClearWhat_15_00"); //Was muss ich 'klären', bevor ich bei euch mitmachen kann?
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_01"); //Onar, der Grundbesitzer, ist derjenige, der uns hier beschäftigt. Nur mit seinem Einverständnis kannst du auf dem Hof bleiben.
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_02"); //Und dann sind da noch die Jungs. Erst wenn die Mehrheit der Söldner dafür ist, dass du mitmachst, kann ich dich aufnehmen.
	AI_Output (self, other, "DIA_Lee_ClearWhat_04_03"); //Aber geh nicht zu Onar, bevor nicht alles klar ist. Er ist ein sehr ungeduldiger Zeitgenosse ...
	
	Log_CreateTopic (TOPIC_BecomeSLD,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BecomeSLD,LOG_RUNNING);
	B_LogEntry (TOPIC_BecomeSLD,"Um bei den Söldnern aufgenommen zu werden, brauche ich das Einverständnis von Onar, wenn ich die Söldner überzeugt habe.");
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
	description = "Wie kann ich die Söldner von mir überzeugen?";
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
	AI_Output (other, self, "DIA_Lee_OtherSld_15_00"); //Wie kann ich die Söldner von mir überzeugen?
	AI_Output (self, other, "DIA_Lee_OtherSld_04_01"); //Am besten, indem du das machst, was von dir als Söldner erwartet wird.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_02"); //Rede mit Torlof. Er ist meistens draußen vorm Haus. Er wird dich auf die Probe stellen.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_03"); //Wenn du dabei nicht versagst, hast du dir schon einen großen Teil des nötigen Repekts verdient.
	AI_Output (self, other, "DIA_Lee_OtherSld_04_04"); //Er wird dir auch alles andere erzählen, was du wissen musst.
	
	B_LogEntry (TOPIC_BecomeSLD,"Um bei den Söldnern aufgenommen zu werden, wird Torlof mich auf die Probe stellen und ich muss mir den Respekt der anderen Söldner verdienen.");
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

	description	 = 	"Was weißt du über den ´Ring des Wassers´?";
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
	AI_Output	(other, self, "DIA_Addon_Lee_Ranger_15_00"); //Was weißt du über den ´Ring des Wassers´?
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_01"); //(lacht) Das hätte ich mir ja denken können. Du musst dich natürlich wieder überall einmischen.
	AI_Output	(other, self, "DIA_Addon_Lee_Ranger_15_02"); //Komm schon, spuck's aus.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_03"); //Ich habe nur am Rande damit zu tun. Ich weiß, dass es hier diese Untergrundgilde gibt und dass die Wassermagier dahinter stecken.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_04"); //Seit dem Fall der Barriere bin ich nicht mehr an das Abkommen gebunden, das ich damals mit den Wassermagiern eingangen bin.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_05"); //Wenn ich helfen kann, tu ich das natürlich auch heute noch. Aber meistens habe ich meine eigenen Probleme und kaum noch Zeit für andere Dinge.
	AI_Output	(self, other, "DIA_Addon_Lee_Ranger_04_06"); //Wenn du mehr darüber erfahren willst, dann solltest du vielleicht besser mal mit Cord sprechen. Er ist einer von ihnen, soviel ich weiß.
		
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
	description = "Ich bin bereit, mich euch anzuschließen!";
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
	AI_Output (other, self, "DIA_Lee_JoinNOW_15_00"); //Ich bin bereit, mich euch anzuschließen!
		
	// ------ Probe ------
	if (Lee_ProbeOK == FALSE)
	{
		if (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS)
		&& (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_01"); //Nicht, bevor du die Probe von Torlof bestanden hast.
		}
		else //Probe bestanden
		{			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_02"); //Dann hast du die Probe von Torlof bestanden?
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_03"); //Ja.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_04"); //Das ist gut.
			Lee_ProbeOK = TRUE;
		};
	};
	
	// ------ Stimmen -------
	if (Lee_ProbeOK == TRUE)
	&& (Lee_StimmenOK == FALSE)
	{
		AI_Output (self, other, "DIA_Lee_JoinNOW_04_05"); //Was sagen die anderen Söldner?
		if (Torlof_GenugStimmen == FALSE)
		{
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_06"); //Ich bin mir nicht sicher, ob genug von ihnen für mich sind.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_07"); //Dann rede noch mal mit Torlof, er bekommt so ziemlich alles mit, was hier auf dem Hof erzählt wird.
		}
		else //genug Stimmen
		{
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_08"); //Die meisten sind für mich.
			Lee_StimmenOK = TRUE;
		};	
	};

	// ------ Onar ------	
	if (Lee_StimmenOK == TRUE)
	&& (Lee_OnarOK == FALSE)
	{		
		if (Onar_Approved == FALSE)
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_09"); //Gut, dann geh jetzt zu Onar. Ich hab schon mit ihm geredet.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_10"); //Über deinen Sold musst du selbst verhandeln.
			Lee_SendToOnar = TRUE;
			B_LogEntry (TOPIC_BecomeSLD,"Jetzt muss ich nur noch das Einverständnis von Onar einholen.");
		}
		else //Onar ist einverstanden
		{
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_11"); //Warst du bei Onar?
			AI_Output (other, self, "DIA_Lee_JoinNOW_15_12"); //Er ist einverstanden.
			Lee_OnarOK = TRUE;
			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_13"); //Willkommen an Bord, Junge!
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_14"); //Hier, nimm dir erstmal 'ne vernünftige Rüstung!
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
			
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_15"); //Freut mich, dass du dabei bist.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_16"); //Ich habe auch schon die erste Aufgabe für dich.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_17"); //Es hat mit den Paladinen zu tun. Es wird Zeit, dass du zu ihnen gehst.
			AI_Output (self, other, "DIA_Lee_JoinNOW_04_18"); //Du wolltest ja ohnehin dorthin.
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
		AI_Output (self, other, "DIA_Lee_KeinSld_04_00"); //Ich sehe, du hast dich in den Dienst der Paladine gestellt.
	}
	
	if (other.guild == GIL_NOV) || (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Lee_KeinSld_04_01"); //Du bist ins Kloster gegangen? (lacht) Ich hatte mit allem gerechnet, nur nicht damit.
	};
	
	AI_Output (self, other, "DIA_Lee_KeinSld_04_02"); //Tja, Söldner kannst du nun nicht mehr werden.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_03"); //Aber wer weiß, vielleicht kannst du das eine oder andere Mal etwas für mich tun - oder ich für dich.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_04"); //Wir werden sehen. Ich wünsch dir jedenfalls alles Gute.
	AI_Output (self, other, "DIA_Lee_KeinSld_04_05"); //Aber lass dir ja nicht einfallen, mich zu verschaukeln, klar?
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
	description = "Und wie komme ich jetzt zu den Paladinen?";
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
	AI_Output (other, self, "DIA_Lee_ToHagen_15_00"); //Und wie komme ich jetzt zu den Paladinen?
	AI_Output (self, other, "DIA_Lee_ToHagen_04_01"); //Ganz einfach. Du wirst unser Friedensangebot zu ihnen bringen.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_02"); //Ich kenne Lord Hagen, den Kommandanten der Paladine, noch von meiner Zeit in der Armee des Königs.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_03"); //Ich weiß, wie er denkt - er hat zu wenig Männer. Er wird auf das Angebot eingehen. Zumindest wird er dich anhören.
	AI_Output (self, other, "DIA_Lee_ToHagen_04_04"); //Ich habe einen Brief verfasst - hier.
	B_GiveInvItems (self,other,ItWr_Passage_MIS,1);
	AI_Output (self, other, "DIA_Lee_ToHagen_04_05"); //Damit wird man dich auf jeden Fall beim Anführer der Paladine vorlassen.
		
	MIS_Lee_Friedensangebot = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Frieden,LOG_MISSION);
	Log_SetTopicStatus (Topic_Frieden,LOG_RUNNING);
	B_LogEntry (Topic_Frieden,"Lee schickt mich mit einem Friedensangebot zu Lord Hagen. Damit werde ich bei den Paladinen vorgelassen.");
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
	description = "Ich habe Lord Hagen das Friedensangebot überbracht!";
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
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_00"); //Ich habe Lord Hagen das Friedensangebot überbracht!
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_01"); //Was hat er gesagt?
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_02"); //Er sagte, er würde dir Absolution gewähren, aber deinen Leuten nicht.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_03"); //Dieser Starrkopf! Die meisten Männer in der Armee des KÖNIGS sind größere Halsabschneider als meine Männer.
	AI_Output (other, self, "DIA_Lee_AngebotSuccess_15_04"); //Was willst du jetzt machen?
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_05"); //Ich werde einen anderen Weg finden müssen, uns hier wegzubringen. Notfalls werden wir das Schiff kapern müssen. Ich muss darüber nachdenken.
	AI_Output (self, other, "DIA_Lee_AngebotSuccess_04_06"); //Meinen eigenen Hals aus der Schlinge zu ziehen und meine Männer hier zurücklassen, kommt nicht in Frage.

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
	description = "Warum willst du unbedingt auf's Festland?";
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
	AI_Output (other, self, "DIA_Lee_Add_15_10"); //Warum willst du unbedingt auf's Festland?
	AI_Output (self ,other, "DIA_Lee_Add_04_11"); //Wie du weißt, habe ich dem König als General gedient.
	AI_Output (self ,other, "DIA_Lee_Add_04_12"); //Aber seine Hofschranzen haben mich hintergangen, weil ich etwas wußte, was ich nicht hätte wissen sollen.
	AI_Output (self ,other, "DIA_Lee_Add_04_13"); //Sie haben mich in die Minenkolonie geworfen, und der König hat es zugelassen.
	AI_Output (self ,other, "DIA_Lee_Add_04_14"); //Ich hatte 'ne Menge Zeit um nachzudenken.
	AI_Output (self ,other, "DIA_Lee_Add_04_15"); //Ich werde mich rächen.
	AI_Output (other, self, "DIA_Lee_Add_15_16"); //(erstaunt) Am König?
	AI_Output (self ,other, "DIA_Lee_Add_04_17"); //(bestimmt) Am König! Und an seinen ganzen Hofschranzen. Sie alle werden bitter bereuen, was sie mir angetan haben...
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
	description = "Ich werde ins Minental aufbrechen.";
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
	AI_Output (other, self, "DIA_Lee_RescueGorn_15_00"); //Ich werde ins Minental aufbrechen.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_01"); //Dass es dich nicht lange auf den Höfen hält, habe ich mir gedacht.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_02"); //Wenn du in die Kolonie zurückkehrst, dann halte die Augen nach Gorn offen. Die Paladine halten ihn dort gefangen.
	AI_Output (self, other, "DIA_Lee_RescueGorn_04_03"); //Gorn ist ein guter Mann und ich kann ihn hier gut gebrauchen, also wenn du eine Chance hast, ihn zu befreien, dann nutze sie.
	
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
	description = "Ich habe Gorn befreit.";
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
	AI_Output (other, self, "DIA_Lee_Success_15_00"); //Ich habe Gorn befreit.
	AI_Output (self, other, "DIA_Lee_Success_04_01"); //Ja, er hat mir schon davon berichtet. Gute Arbeit.
	AI_Output (self, other, "DIA_Lee_Success_04_02"); //Er ist mehr wert als Sylvio und seine Jungs zusammen.
	
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
	description = "Gorn hat von mir erzählt?? Was ist mit ihm?";
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
	AI_Output (other, self, "DIA_Lee_AboutGorn_15_00"); //Gorn hat von mir erzählt?? Was ist mit ihm?
	AI_Output (self, other, "DIA_Lee_AboutGorn_04_01"); //Du kennst ihn doch noch, oder?
	
	Info_ClearChoices (DIA_Lee_AboutGorn);
	Info_AddChoice (DIA_Lee_AboutGorn, "Mal überlegen...", DIA_Lee_AboutGorn_Who);
	Info_AddChoice (DIA_Lee_AboutGorn, "Klar.", DIA_Lee_AboutGorn_Yes);
};

func void DIA_Lee_AboutGorn_Yes()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_Yes_15_00"); //Klar.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_01"); //Er hat sich von den Paladinen schnappen lassen und ist mit einem Strafkonvoi zurück ins Minental geschickt worden.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_02"); //Wenn der Weg zum Minental nicht mit Paladinen und Orks gepflastert wäre, wäre ich schon mit ein paar Jungs losgezogen, um ihn zu befreien.
	AI_Output (self, other, "DIA_Lee_AboutGorn_Yes_04_03"); //Aber so hat es keinen Sinn. Armer Teufel.
	Info_ClearChoices (DIA_Lee_AboutGorn);
};

func void DIA_Lee_AboutGorn_Who()
{
	AI_Output (other, self, "DIA_Lee_AboutGorn_Who_15_00"); //Mal überlegen ...
	AI_Output (self, other, "DIA_Lee_AboutGorn_Who_04_01"); //Groß, schwarz, böse, mit einer riesigen Axt - er hat damals in der Kolonie mir dir zusammen unsere Erzmine zurückerobert.
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
	description = "Wegen Bullco hat Onar jetzt ein paar Schafe weniger...";
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
	AI_Output (other, self, "DIA_Lee_Add_15_00"); //Wegen Bullco hat Onar jetzt ein paar Schafe weniger...
	AI_Output (self ,other, "DIA_Lee_Add_04_01"); //Ach, lass mich doch in Ruhe mit der Scheiße! Ich hab so schon genug Ärger.
	if (Bullco_scharf == TRUE)
	&& (!Npc_IsDead(Bullco))
	{
		AI_Output (other, self, "DIA_Lee_Add_15_02"); //Ich auch. Bullco hat wohl ein Problem mit mir. Er will, daß ich den Hof verlasse...
		AI_Output (self ,other, "DIA_Lee_Add_04_03"); //Ja und? Setz dich durch.
		AI_Output (self ,other, "DIA_Lee_Add_04_04"); //Du kannst ihm sagen, er soll sich schön zurückhalten, sonst zieh ich ihm die verlorenen Schafe vom Sold ab...
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
	description = "Ich komme aus dem Minental...";
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
	AI_Output (other, self, "DIA_Lee_Add_15_18"); //Ich komme aus dem Minental. Die Burg dort wurde von Drachen angegriffen!
	AI_Output (self ,other, "DIA_Lee_Add_04_19"); //Also doch! Lares hat erzählt, daß in der Stadt Gerüchte über Drachen kursieren... Ich habe es nicht geglaubt...
	AI_Output (self ,other, "DIA_Lee_Add_04_20"); //Was ist mit den Paladinen?
	AI_Output (other, self, "DIA_Lee_Add_15_21"); //Sie sind ziemlich dezimiert worden.
	if (other.guild == GIL_SLD)
	{
		AI_Output (self ,other, "DIA_Lee_Add_04_22"); //Gut! Vielleicht denkt Lord Hagen jetzt noch einmal über mein Angebot nach...
		AI_Output (self ,other, "DIA_Lee_Add_04_23"); //Und wenn nicht... (hart) Dann werden wir einen anderen Weg finden hier wegzukommen...
	}
	else
	{
		AI_Output (self ,other, "DIA_Lee_Add_04_24"); //Gut! Vielleicht wird das Lord Hagen dazu bringen, mit seinen Männern ins Minental zu ziehen...
		AI_Output (self ,other, "DIA_Lee_Add_04_25"); //Je weniger Paladine sich hier aufhalten, desto besser.
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
	description = "Wie sieht's mit 'ner besseren Rüstung aus?";
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
	AI_Output (other,self ,"DIA_Lee_ArmorM_15_00"); //Wie sieht's mit 'ner besseren Rüstung aus?
	
	if (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	&& (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_01"); //Du hast deinen Auftrag erfüllt.
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_02"); //Ich habe hier eine bessere Rüstung für dich. Das heißt, wenn du das nötige Kleingeld hast.
		
		Lee_Give_Sld_M = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_03"); //Torlof hat noch einen Auftrag von Onar, der schon seit einiger Zeit erledigt werden muss.
		AI_Output (self ,other,"DIA_Lee_ArmorM_04_04"); //Kümmere dich zuerst darum - dann reden wir über eine bessere Rüstung!
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
	description = "Mittlere Söldnerrüstung kaufen. Schutz: Waffen 50, Pfeile 50. Kosten: 1000 Gold";
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
	AI_Output (other,self ,"DIA_Lee_BuyArmorM_15_00"); //Gib mir die Rüstung.
	
	if (B_GiveInvItems (other, self, itmi_gold, 1000))
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorM_04_01"); //Hier hast du sie. Eine gute Rüstung.
		//B_GiveInvItems (self, other, itar_sld_M, 1);
		CreateInvItems (other, ItAr_Sld_M, 1);
		AI_EquipArmor (other, ItAr_Sld_M);
			
		Lee_SldMGiven = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorM_04_02"); //Aber nicht geschenkt! Zuerst will ich das Gold sehen!
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
	description = "Hast du eine bessere Rüstung für mich?";
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
	AI_Output (other,self ,"DIA_Lee_ArmorH_15_00"); //Hast du eine bessere Rüstung für mich?
	AI_Output (self ,other,"DIA_Lee_ArmorH_04_01"); //Ich habe eine.
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
	description = "Schwere Söldnerrüstung kaufen. Schutz: Waffen 80, Pfeile 80. Kosten: 2500 Gold";
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
	AI_Output (other,self ,"DIA_Lee_BuyArmorH_15_00"); //Gib mir die schwere Rüstung.
	
	if (B_GiveInvItems (other, self, itmi_gold, 2500))
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorH_04_01"); //Hier. Eine sehr gute Rüstung. Es ist die gleiche, die ich auch trage.
		//CreateInvItems (self,itar_sld_H,1);
		//B_GiveInvItems (self, other, itar_sld_H, 1);
		
		CreateInvItems (other, ItAr_Sld_H, 1);
		AI_EquipArmor (other, ItAr_Sld_H);
		
		Lee_SldHGiven = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_BuyArmorH_04_02"); //Du weißt, wie's läuft. Zuerst das Gold!
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
	description = "Hast du nicht noch was zu tun für mich?";
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
	AI_Output (other,self ,"DIA_Lee_Richter_15_00"); //Hast du nicht noch was zu tun für mich?
	AI_Output (self ,other,"DIA_Lee_Richter_04_01"); //Du kriegst den Hals nicht voll, was? Du hast doch so schon genug Ärger. Was willst du denn noch?
	AI_Output (other,self ,"DIA_Lee_Richter_15_02"); //Noch einen Job. Ich bin Söldner, schon vergessen?
	AI_Output (self ,other,"DIA_Lee_Richter_04_03"); //In Ordnung. Ich hab da was. Das wäre genau das Richtige für dich.
	AI_Output (self ,other,"DIA_Lee_Richter_04_04"); //Ich habe mit dem Richter der Stadt noch eine Rechnung offen. Am liebsten würde ich die Sache selbst erledigen.
	AI_Output (self ,other,"DIA_Lee_Richter_04_05"); //Die Paladine würden mich aber nicht mal nahe genug an sein Haus lassen, um mit einem Stein nach ihm werfen zu können.
	AI_Output (self ,other,"DIA_Lee_Richter_04_06"); //Die Sache muss schon ein bisschen durchdachter ablaufen. Also pass auf. Du wirst zum Richter gehen und ihm deine Dienste anbieten.
	AI_Output (self ,other,"DIA_Lee_Richter_04_07"); //Du wirst versuchen, sein Vertrauen zu gewinnen und irgendwelche schmierigen Aufträge für ihn erledigen, bis du etwas Belastendes gegen ihn finden kannst.
	AI_Output (self ,other,"DIA_Lee_Richter_04_08"); //Der Kerl hat so viel Dreck am Stecken, dass es zum Himmel stinkt.
	AI_Output (self ,other,"DIA_Lee_Richter_04_09"); //Bring mir etwas, womit ich ihn bei der Miliz anschwärzen kann, so dass er für den Rest seines Lebens im Knast verschimmelt.
	AI_Output (self ,other,"DIA_Lee_Richter_04_10"); //Ich will aber nicht, dass du ihn umbringst. Das wäre viel zu schnell. Ich will, dass er leidet, verstehst du?
	AI_Output (self ,other,"DIA_Lee_Richter_04_11"); //Meinst du, du kriegst das hin?
	
	
	Log_CreateTopic (TOPIC_RichterLakai, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RichterLakai, LOG_RUNNING);
	B_LogEntry (TOPIC_RichterLakai,"Lee will, dass ich etwas Belastendes gegen den Richter von Khorinis finde. Ich soll dem Richter meine Dienste anbieten und dabei die Augen offen halten."); 

	MIS_Lee_JudgeRichter = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Lee_Richter);
	Info_AddChoice	(DIA_Lee_Richter, "Das mach´ ich nicht.", DIA_Lee_Richter_nein );
	Info_AddChoice	(DIA_Lee_Richter, "Kein Problem. Wieviel?", DIA_Lee_Richter_wieviel );
};
func void DIA_Lee_Richter_wieviel ()
{
	AI_Output			(other, self, "DIA_Lee_Richter_wieviel_15_00"); //Kein Problem. Wie viel?
	AI_Output			(self, other, "DIA_Lee_Richter_wieviel_04_01"); //Deine Belohnung hängt davon ab, was du mir bringst. Also streng dich an.
	Info_ClearChoices	(DIA_Lee_Richter);
};
func void DIA_Lee_Richter_nein ()
{
	AI_Output			(other, self, "DIA_Lee_Richter_nein_15_00"); //Das mach ich nicht. Ich spiel doch nicht den Fußabtreter für den Dreckskerl.
	AI_Output			(self, other, "DIA_Lee_Richter_nein_04_01"); //Stell dich nicht so an. Immerhin hat er dich damals verknackt und in die Barriere werfen lassen. Schon vergessen?
	AI_Output			(self, other, "DIA_Lee_Richter_nein_04_02"); //Mach, was du willst, aber ich denke, du wirst dich richtig entscheiden.
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

	description = "Ich hab was Belastendes gegen den Richter gefunden.";
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
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_00"); //Ich hab was Belastendes gegen den Richter gefunden.
	AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_01"); //Wirklich? Was ist es?
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_02"); //Er hat einige Typen damit beauftragt, den Statthalter von Khorinis zu überfallen.
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_03"); //Kurz danach hat er sie verhaften lassen und sich das ganze Gold eingestrichen.
	AI_Output (other,self ,"DIA_Lee_RichterBeweise_15_04"); //Ich hab dir den schriftlichen Auftrag des Richters an die Kerle als Beweis dafür mitgebracht.
	AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_05"); //Zeig her.
	B_GiveInvItems (other, self, ItWr_RichterKomproBrief_MIS,1);
	B_UseFakeScroll();

	if  ((Npc_IsDead(Richter))== FALSE)
		{
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_06"); //Na, endlich. Das wird reichen, ihn bluten zu lassen. Ich bin beeindruckt.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_07"); //Das lass ich mir einiges kosten. Hier hast du deine Belohnung.
			CreateInvItems (self, ItMi_Gold, 500);									
			B_GiveInvItems (self, other, ItMi_Gold, 500);		
			MIS_Lee_JudgeRichter = LOG_SUCCESS;
			B_GivePlayerXP (XP_JudgeRichter);			
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_08"); //Und zu keinem ein Wort darüber, klar?
		}
	else
		{
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_09"); //Das ist toll. Aber die Geschichte hat sich schon erledigt. Der Richter ist tot.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_10"); //Irgendein Idiot hat ihn von dieser Welt gepustet. Na ja. Auch gut.
			AI_Output (self ,other,"DIA_Lee_RichterBeweise_04_11"); //Hier hast du ein paar Kröten. Mehr ist mir der Lappen hier nicht mehr wert.
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
	description = "Was ist mit Bennet?";
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
	AI_Output (other,self ,"DIA_Lee_TalkAboutBennet_15_00"); //Was ist mit Bennet?
	AI_Output (self ,other,"DIA_Lee_TalkAboutBennet_04_01"); //Du hast es also schon mitgekriegt. Die Hunde haben ihn eingelocht, einfach so.
	if ((hero.guild != GIL_MIL)&&(hero.guild != GIL_PAL))
	{
	AI_Output (self ,other,"DIA_Lee_TalkAboutBennet_04_02"); //Als ob ich nicht schon genug Probleme mit meinen eigenen Leuten hätte, jetzt kann ich mich auch noch um die Paladine kümmern.
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
	description = "Was willst du wegen Bennet unternehmen?";
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
	AI_Output (other,self ,"DIA_Lee_DoAboutBennet_15_00"); //Was willst du wegen Bennet unternehmen?
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_01"); //Ich weiß noch nicht. Ein paar von den Jungs würden am liebsten in die Stadt rennen und diesem Lord Hagen die Zähne einschlagen.
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_02"); //Zum Glück sind wir nicht genug Leute für so eine Aktion, außerdem ist es nicht mein Stil.
	AI_Output (other,self ,"DIA_Lee_DoAboutBennet_15_03"); //Willst du hier bleiben und abwarten, was passiert?
	AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_04"); //Bestimmt nicht.
	
	B_LogEntry (TOPIC_RESCUEBENNET,"Wenn es mir nicht schnell gelingt Bennets Unschuld zu beweisen, kann Lee für Nichts garantieren. Seine Leute würden lieber heute als morgen die Stadt angreifen um Bennet selbst rauszuholen."); 
	
	if (!Npc_IsDead (Lares))
	{ 
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_05"); //Lares ist noch in der Stadt und versucht herauszufinden, wie wir Bennet da rausholen können.
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_06"); //Bis das geschehen ist, versuche ich, meine Leute zu beruhigen. Ich hoffe nur, dass Lares nicht so lange braucht.
	};
		
	if (!Npc_IsDead (Buster))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{ 
		AI_Output (self ,other,"DIA_Lee_DoAboutBennet_04_07"); //Ach ja. Bevor ich es vergesse ... Buster will mit dir sprechen. Worum es geht, wollte er mir nicht sagen. Vielleicht gehst du mal zu ihm!
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
	description = "Kann ich dir bei der Sache mit Bennet helfen?";
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
	AI_Output (other,self ,"DIA_Lee_CanHelpYou_15_00"); //Kann ich dir bei der Sache mit Bennet helfen?
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_01"); //Klar, ein bisschen Grips und Vernunft wird der Sache sicherlich gut tun.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_02"); //Idioten laufen hier, weiß Innos, genug rum.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_03"); //Geh in die Stadt und sieh zu, dass du einen Weg findest, Bennet da rauszuholen.
	AI_Output (self ,other,"DIA_Lee_CanHelpYou_04_04"); //Aber lass dir nicht zu viel Zeit, ich weiß nicht, wie lange ich die Männer unter Kontrolle halten kann.
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
	description = "Gibt's was Neues wegen Bennet?";
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
	AI_Output (other,self ,"DIA_Lee_AnyNews_15_00"); //Gibt's was Neues wegen Bennet?

	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_01"); //Er scheint im Knast zumindest keine bleibenden Schäden davongetragen zu haben.
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_02"); //Gute Arbeit.

		if (DIA_Lee_AnyNews_OneTime == FALSE)
		{
			B_GivePlayerXP (XP_AMBIENT);
			DIA_Lee_AnyNews_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_Lee_AnyNews_04_03"); //Nein, wir wissen noch nicht genug.
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

	description	 = 	"Was ist in der Zwischenzeit passiert?";
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
	AI_Output			(other, self, "DIA_Lee_SYLVIO_15_00"); //Was ist in der Zwischenzeit passiert?
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_01"); //Sylvio, der Mistkerl, hat was über die Drachen im Minental gehört und hat darauf hin alle hier auf dem Hof völlig verrückt gemacht.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_02"); //Er hat versucht, die Jungs zu überreden, ihm ins Minental zu folgen. Ruhm, Ehre, Gold und alles mögliche hat er ihnen versprochen.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_03"); //Viele von ihnen hatten kein Interesse, sich für Sylvio töten zu lassen, aber es gab da so manchen Idioten, den konnte er doch überzeugen.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_04"); //Das Ende vom Lied war, dass sie sich von Bennet haben ausrüsten lassen und dann kurzerhand losgezogen sind.
	AI_Output			(self, other, "DIA_Lee_SYLVIO_04_05"); //(winkt ab) Eh. Im Grunde bin ich froh, dass Sylvio endlich vom Hof ist.
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
	description	 = 	"Kannst du mich trainieren?";
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
	AI_Output			(other, self, "DIA_Lee_CanTeach_15_00"); //Kannst du mich trainieren?
	
	AI_Output			(self, other, "DIA_Lee_CanTeach_04_01"); //Ich kann dir zeigen, wie man mit dem Zweihänder kämpft.
	
	if (other.HitChance[NPC_TALENT_2H] < 75)
	{
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_02"); //Allerdings habe ich nicht die Zeit, dir auch noch die Grundlagen beizubringen.
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_03"); //Sobald du eine gewisse Fähigkeit hast, werde ich mich deiner annehmen. Vorher solltest du dir einen anderen Lehrer suchen.
	}
	else
	{
		AI_Output			(self, other, "DIA_Lee_CanTeach_04_04"); //Ich hab schon gehört, dass du ziemlich gut bist. Aber ich wette, ich kann dir noch ein paar Sachen beibringen.
		if (other.guild == GIL_SLD)
		|| (other.guild == GIL_DJG)
		{
			Lee_TeachPlayer = TRUE;
			Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
			B_LogEntry (Topic_SoldierTeacher,"Lee wird mich im Kampf mit zweihändigen Waffen unterrichten.");
		}
		else
		{
			AI_Output			(self, other, "DIA_Lee_CanTeach_04_05"); //Also, wenn du willst, bringe ich dir etwas bei. Das wird dich allerdings 'ne Kleinigkeit kosten.
			AI_Output			(other,self , "DIA_Lee_CanTeach_15_06"); //Wie viel?
			AI_Output			(self, other, "DIA_Lee_CanTeach_04_07"); //1000 Goldstücke und wir sind im Geschäft.
		
			Info_ClearChoices (DIA_Lee_CanTeach);
			Info_AddChoice (DIA_Lee_CanTeach,"Das ist mir zu teuer.",DIA_Lee_CanTeach_No);
		
			if (Npc_HasItems (other,ItMi_Gold) >= 1000)
			{
				Info_AddChoice (DIA_Lee_CanTeach,"Einverstanden. Hier ist das Geld.",DIA_Lee_CanTeach_Yes);
			};
		};
	};		
};
 
FUNC VOID DIA_Lee_CanTeach_No ()
{
	AI_Output (other,self ,"DIA_Lee_CanTeach_No_15_00"); //Das ist mir zu teuer.
	AI_Output (self ,other,"DIA_Lee_CanTeach_No_04_01"); //Überleg's dir, Lehrer in meiner Gewichtsklasse wirst du schwer finden.
	
	Info_ClearChoices (DIA_Lee_CanTeach);
}; 

FUNC VOID DIA_Lee_CanTeach_Yes ()
{
	AI_Output (other,self ,"DIA_Lee_CanTeach_Yes_15_00"); //Einverstanden. Hier ist das Gold.
	AI_Output (self ,other,"DIA_Lee_CanTeach_Yes_04_01"); //Also gut, ich verspreche dir: Ich bin meinen Preis wert.
	
	B_GiveInvItems (other,self,ItMi_Gold,1000);
	Lee_TeachPlayer = TRUE;
	Info_ClearChoices (DIA_Lee_CanTeach);
	Log_CreateTopic (Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry (Topic_SoldierTeacher,"Lee wird mich im Kampf mit zweihändigen Waffen unterrichten.");
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
	description = "Lass uns mit dem Training beginnen.";
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
	AI_Output (other,self ,"DIA_Lee_Teach_15_00"); //Lass uns mit dem Training beginnen.
	
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
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_00"); //Du bist jetzt ein wahrer Meister im beidhändigen Kampf.
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_01"); //Du brauchst keinen Lehrer mehr.
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
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_00"); //Du bist jetzt ein wahrer Meister im beidhändigen Kampf.
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_01"); //Du brauchst keinen Lehrer mehr.
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

	description	 = 	"Die Echsenmenschen verteilen Dracheneier über's ganze Land.";
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
	AI_Output			(other, self, "DIA_Lee_DRACHENEI_15_00"); //Die Echsenmenschen verteilen Dracheneier über's ganze Land.
	B_GivePlayerXP (XP_Ambient);
	AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_01"); //Das hätte ich mir denken können. Es wird Zeit, dass wir hier verschwinden.
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output			(other, self, "DIA_Lee_DRACHENEI_15_02"); //Was soll ich jetzt damit machen?
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_03"); //Zerschlagen. Was sonst?
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_04"); //Vielleicht kann man die Schale für den Rüstungsbau oder ähnliches verwenden.
		AI_Output			(self, other, "DIA_Lee_DRACHENEI_04_05"); //Sie sieht ziemlich stabil aus. Sprich mal mit Bennet darüber.
		B_LogEntry (TOPIC_DRACHENEIER,"Lee konnte mit dem Drachenei so recht nichts anfangen. Er schickte mich zu Bennet dem Schmied. "); 
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
	description = "Wie läuft's auf dem Hof? ";
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
	AI_Output (other,self ,"DIA_Lee_KAP4_Perm_15_00"); //Wie läuft's auf dem Hof?
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_01"); //Na ja, seit Sylvio weg ist, haben wir hier endlich mehr Ruhe.
	AI_Output (other,self ,"DIA_Lee_KAP4_Perm_15_02"); //Hört sich doch gut an.
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_03"); //Leider haben wir nicht weniger Arbeit. Die Männer werden immer unzufriedener, weil sie jetzt auch noch die Aufgaben von Sylvios Männern machen müssen.
	AI_Output (self ,other,"DIA_Lee_KAP4_Perm_04_04"); //Aber lass das mal meine Sorge sein. Mit denen werde ich schon fertig.
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
	
	description	 = 	"Hast du eine Ahnung, wie ich an das Schiff der Paladine komme?";
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
	AI_Output	(other, self, "DIA_Lee_GetShip_15_00"); //Hast du eine Ahnung, wie ich an das Schiff der Paladine komme?
	AI_Output	(self, other, "DIA_Lee_GetShip_04_01"); //Meinst du, dann wäre ich noch hier? Das Ding ist besser bewacht als früher die Erztransporte des alten Lagers.
	AI_Output	(other, self, "DIA_Lee_GetShip_15_02"); //Es muss doch eine Möglichkeit geben, auf das Schiff zu kommen.
	AI_Output	(self, other, "DIA_Lee_GetShip_04_03"); //Klar. Drauf kommen ist einfach.
	
	Log_CreateTopic (TOPIC_Ship, LOG_MISSION);   	                                                                                                                                                                                                                                             
	Log_SetTopicStatus(TOPIC_Ship, LOG_RUNNING);                                                                                                                                                                                                                                                 
			
		if (MIS_Lee_JudgeRichter == LOG_SUCCESS)
		&& ((Npc_IsDead(Richter))== FALSE)
		{
			AI_Output	(self, other, "DIA_Lee_GetShip_04_04"); //Immerhin haben wir jetzt den Richter in unserer Gewalt. Du gehst am besten zu ihm und quetscht ein Ermächtigungsschreiben für das Schiff aus ihm heraus.
			MIS_RichtersPermissionForShip = LOG_RUNNING;
			B_LogEntry (TOPIC_Ship,"Lee meint, die beste Möglichkeit an das Schiff der Paladine zu kommen ist ein Ermächtigungsschreiben des Richters. Das wird er mir aber wohl nicht freiwillig geben.");
		}
		else if ((hero.guild == GIL_SLD)||(hero.guild == GIL_DJG))
		{
			AI_Output	(self, other, "DIA_Lee_GetShip_04_05"); //Ich habe hier ein gefälschtes Ermächtigungsschreiben. Damit werden dich die Schiffswachen passieren lassen.
		
			B_LogEntry (TOPIC_Ship,"Der gute alte Lee. Er hat einen gefälschten Brief, der mich ermächtigt auf das Schiff der Paladine zu kommen.");
		};

	AI_Output	(self, other, "DIA_Lee_GetShip_04_06"); //Aber das ist noch nicht alles. Um das Schiff zu lenken, brauchst du einen Kapitän, 'ne Mannschaft und so weiter.
	AI_Output	(self, other, "DIA_Lee_GetShip_04_07"); //Da hängt ein riesiger Rattenschwanz dran.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 
	                  
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);  
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);
	                  
	Info_ClearChoices	(DIA_Lee_GetShip);
	Info_AddChoice	(DIA_Lee_GetShip, DIALOG_BACK, DIA_Lee_GetShip_back );
	Info_AddChoice	(DIA_Lee_GetShip, "Wen soll ich als Mannschaft anheuern?", DIA_Lee_GetShip_crew );
	
	if ((Npc_IsDead(Torlof))== FALSE)
	{
		Info_AddChoice	(DIA_Lee_GetShip, "Kennst du jemanden, der ein Schiff lenken kann?", DIA_Lee_GetShip_torlof );
	};

};
func void DIA_Lee_GetShip_torlof ()
{
	AI_Output			(other, self, "DIA_Lee_GetShip_torlof_15_00"); //Kennst du jemanden, der ein Schiff lenken kann?
	AI_Output			(self, other, "DIA_Lee_GetShip_torlof_04_01"); //Soviel ich weiß, ist Torlof früher zur See gefahren. Er kennt sich aus.

	B_LogEntry (TOPIC_Captain,"Torlof ist ein alter Seemann, vielleicht will er bei mir als Kapitän anheuern.");
};

func void DIA_Lee_GetShip_crew ()
{
	AI_Output			(other, self, "DIA_Lee_GetShip_crew_15_00"); //Wen soll ich als Mannschaft anheuern?
	AI_Output			(self, other, "DIA_Lee_GetShip_crew_04_01"); //Das musst du selbst entscheiden. Aber ich würde nur Leute mitnehmen, denen ich vertraue. Hast du genug Leute, denen du vertraust?
	AI_Output			(self, other, "DIA_Lee_GetShip_crew_04_02"); //Wenn du einen Schmied in deiner Mannschaft brauchst, solltest du Bennet fragen. Er ist sicherlich der Beste, denn du je finden wirst.

	B_LogEntry (TOPIC_Crew,"Was meine Mannschaft angeht, konnte Lee mir auch nicht viel weiterhelfen. Er mient aber, dass ich nur Leute mitnehmen soll, denen ich auch vertraue. Außerdem soll ich mal Bennet fragen, er könnte interesse haben.");
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

	description	 = 	"Die Sache mit dem Ermächtigungsschreiben hat geklappt.";
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
	AI_Output			(other, self, "DIA_Lee_GotRichtersPermissionForShip_15_00"); //Die Sache mit dem Ermächtigungsschreiben hat geklappt. Das Schiff gehört mir. Der Richter war sehr kooperativ.
	AI_Output			(self, other, "DIA_Lee_GotRichtersPermissionForShip_04_01"); //Tja. Dein langer Weg der Erniedrigung bei dem Kerl hat sich zu guter Letzt doch noch bezahlt gemacht.
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
	description	 = 	"Ich will das Schiff klauen.";
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
	AI_Output	(other, self, "DIA_Lee_StealShip_15_00"); //Ich will das Schiff klauen.
	AI_Output	(self, other, "DIA_Lee_StealShip_04_01"); //Und wie soll das passieren?
	AI_Output	(other, self, "DIA_Lee_StealShip_15_02"); //Ganz einfach, ich gehe hin, zeige deine Papiere und nehme mir das Schiff.
	AI_Output	(self, other, "DIA_Lee_StealShip_04_03"); //Wie du meinst. Hier, ich hoffe, du weißt, was du tust.
	
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
	description	 = 	"Würdest du mit aufs Schiff kommen?";
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
	AI_Output			(other, self, "DIA_Lee_KnowWhereEnemy_15_00"); //Würdest du mit aufs Schiff kommen?
	AI_Output			(self, other, "DIA_Lee_KnowWhereEnemy_04_01"); //Machst du Witze? Natürlich wäre ich dabei. Ich hab auf dem Festland noch ein paar alte Rechnungen zu begleichen.
	AI_Output			(self, other, "DIA_Lee_KnowWhereEnemy_04_02"); //Außerdem könnte ich dich im Kampf mit der Ein- und der Zweihandwaffe unterweisen. Ich könnte also von großem Nutzen für dich sein.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);                                                                                        	                 
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING); 	                                                                                  	                 
	B_LogEntry (TOPIC_Crew,"Lee brennt darauf das Festland wieder zu sehen. Er hat mir angeboten mich zu unterstützen. Einen besseren Kampflehrer werde ich wohl kaum finden.");
	
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_Lee_KnowWhereEnemy_15_03"); //Das Schiff ist voll, aber wenn sich was ergibt, komme ich wieder.
	}
	else 
	{
		Info_ClearChoices (DIA_Lee_KnowWhereEnemy);
		Info_AddChoice (DIA_Lee_KnowWhereEnemy,"Wenn ich dich brauchen kann, sage ich bescheid.",DIA_Lee_KnowWhereEnemy_No);
		Info_AddChoice (DIA_Lee_KnowWhereEnemy,"Dann pack deine Sachen!",DIA_Lee_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_Lee_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_Yes_15_00"); //Dann pack deine Sachen!
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_Yes_04_01"); //Was denn? Jetzt sofort?
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_Yes_15_02"); //Ja, ich habe vor, hier zu verschwinden, und wenn du mitkommen willst, komm zum Hafen. Wir treffen uns am Schiff.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_Yes_04_03"); //Ich habe schon so lange auf diesen Moment gewartet. Ich werde dort sein.
	
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
	AI_Output (other,self ,"DIA_Lee_KnowWhereEnemy_No_15_00"); //Wenn ich dich brauchen kann, sage ich Bescheid.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_No_04_01"); //Du musst wissen, was du willst. Aber gute Kämpfer kann man nie genug um sich herum haben.
	AI_Output (self ,other,"DIA_Lee_KnowWhereEnemy_No_04_02"); //(grinst) Es sei denn, es sind so Schwachköpfe wie Sylvio.

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
	description	 = 	"Ich kann dich doch nicht gebrauchen!";
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
	AI_Output			(other, self, "DIA_Lee_LeaveMyShip_15_00"); //Ich kann dich doch nicht gebrauchen!
	AI_Output			(self, other, "DIA_Lee_LeaveMyShip_04_01"); //Wie du meinst, du weißt ja, wo du mich findest!
	
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
	description	 = 	"Ich kann dich doch gebrauchen!";
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
	AI_Output			(other, self, "DIA_Lee_StillNeedYou_15_00"); //Ich kann dich doch gebrauchen!
	
	if (Lee_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_01"); //Ich hab doch gewusst, dass du mich brauchst. Wir sehen uns am Schiff!
		
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
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_02"); //Weißt du was, du kannst mich mal. Erst sagst du, ich soll kommen, dann schickst du mich wieder weg.
		AI_Output	(self, other, "DIA_Lee_StillNeedYou_04_03"); //Such dir einen anderen Idioten!
	
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



































