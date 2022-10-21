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
	AI_Output (self, other, "DIA_Garond_PMSchulden_10_00"); //Bevor wir irgendwas besprechen, zahlst du erstmal deine Strafe.

	if (B_GetTotalPetzCounter(self) > Garond_LastPetzCounter)
	{
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_01"); //Und die ist seit den letzten Anschuldigungen gestiegen.
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_02"); //Anscheinend hast du dir noch mehr �rger aufgehalst.
		
		if (Garond_Schulden < 1000)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_03"); //Aber ich hoffe, dass du jetzt f�r alles bezahlen wirst! Insgesamt sind das ...
		}
		else
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_04"); //Ich bin schwer entt�uscht von dir. Deine Strafe bel�uft sich auf ...
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
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_05"); //Es haben sich ein paar neue Dinge ergeben.
		
		if (Garond_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_06"); //Pl�tzlich bezichtigt dich niemand mehr des Mordes.
		};
		
		if (Garond_LastPetzCrime == CRIME_THEFT)
		|| ( (Garond_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_07"); //Niemand erinnert sich dran, dich beim Diebstahl gesehen zu haben.
		};
		
		if (Garond_LastPetzCrime == CRIME_ATTACK)
		|| ( (Garond_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_08"); //Es gibt keine Zeugen mehr daf�r, dass du jemals in eine Schl�gerei verwickelt warst.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_09"); //Anscheinend sind alle Anschuldigungen gegen dich fallen gelassen worden.
		};
		
		AI_Output (self, other, "DIA_Garond_PMSchulden_10_10"); //Ich wei� nicht, was da gelaufen ist, aber ich warne dich: Treib es nicht zu weit!
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_11"); //Ich habe mich entschieden, dir deine Schulden zu erlassen.
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_12"); //Und mach blo� keinen �rger mehr in der Burg!
	
			Garond_Schulden			= 0;
			Garond_LastPetzCounter 	= 0;
			Garond_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_13"); //Damit eines klar ist: Deine Strafe musst du trotzdem in voller H�he zahlen.
			B_Say_Gold (self, other, Garond_Schulden);
			AI_Output (self, other, "DIA_Garond_PMSchulden_10_14"); //Also, was ist?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(DIA_Garond_PMSchulden);
		Info_ClearChoices  	(DIA_Garond_PETZMASTER);
		Info_AddChoice		(DIA_Garond_PMSchulden,"Ich habe nicht genug Gold!",DIA_Garond_PETZMASTER_PayLater);
		Info_AddChoice		(DIA_Garond_PMSchulden,"Wieviel war es nochmal?",DIA_Garond_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
		{
			Info_AddChoice 	(DIA_Garond_PMSchulden,"Ich will die Strafe zahlen.",DIA_Garond_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Garond_PMSchulden_HowMuchAgain()
{
	AI_Output (other, self, "DIA_Garond_PMSchulden_HowMuchAgain_15_00"); //Wie viel war es noch mal?
	B_Say_Gold (self, other, Garond_Schulden);

	Info_ClearChoices  	(DIA_Garond_PMSchulden);
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_AddChoice		(DIA_Garond_PMSchulden,"Ich habe nicht genug Gold!",DIA_Garond_PETZMASTER_PayLater);
	Info_AddChoice		(DIA_Garond_PMSchulden,"Wieviel war es nochmal?",DIA_Garond_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
	{
		Info_AddChoice 	(DIA_Garond_PMSchulden,"Ich will die Strafe zahlen.",DIA_Garond_PETZMASTER_PayNow);
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
	Garond_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime h�her ist...
	
	// ------ SC hat mit Garond noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_00"); //Du bist also der Kerl, der hier in der Burg �rger gemacht hat.
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_01"); //Ich habe mich schon gefragt, wie lange es dauert, bis du zu mir kommst.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_02"); //Mord ist so ziemlich das Letzte, das ich hier gebrauchen kann!
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_03"); //Ich bin auf jeden meiner Leute angewiesen - und jetzt habe ich wieder einen weniger!
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50
		Garond_Schulden = Garond_Schulden + 500;						//PLUS M�rder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_04"); //Ganz zu schweigen von den anderen Sachen, die du angerichtet hast.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_05"); //Ich erkl�re dir jetzt mal was. Wir sitzen hier alle gemeinsam in der Falle.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_06"); //Und ich bin auf jeden einzelnen meiner M�nner angewiesen. Auch auf dich.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_07"); //Wenn du jemanden umbringen willst, dann brauchst du nur die Burg zu verlassen. Da gibt's genug Orks.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_08"); //Ich werde dir eine Strafe aufdr�cken - obwohl ich mich eigentlich gar nicht mit so einer Schei�e besch�ftigen will.
	};		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_09"); //Ich hab geh�rt, das du hier Sachen mitgehen l�sst.
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_10"); //Ganz zu schweigen von den anderen Sachen, die mir berichtet wurden.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_11"); //Das werde ich dir nicht durchgehen lassen. Ich glaube du untersch�tzt den Ernst der Lage.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_12"); //Du wirst eine Strafe zahlen, um dein Verbrechen wieder gut zu machen!
		
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_13"); //Ich sehe es nicht gerne, wenn es Schl�gereien zwischen meinen M�nnern gibt.
	
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, other, "DIA_Garond_PETZMASTER_10_14"); //Und die Sache mit den Schafen musste wohl auch nicht sein.
		};
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_15"); //Also wirst du deine Strafe daf�r zahlen!
		
		
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};

	// ------ Schaf get�tet (es gibt drei Schafe in der Burg) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_16"); //Du gehst rum und t�test unsere Schafe? Die geh�ren uns allen.
		AI_Output (self, other, "DIA_Garond_PETZMASTER_10_17"); //Du wirst mir das Fleisch bezahlen.
	
		
		Garond_Schulden = 100;
	
	};
	
	AI_Output (other, self, "DIA_Garond_PETZMASTER_15_18"); //Wie viel?
	
	if (Garond_Schulden > 1000)	{	Garond_Schulden = 1000;	};
		
	B_Say_Gold (self, other, Garond_Schulden);
	
	Info_ClearChoices  	(DIA_Garond_PMSchulden);
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_AddChoice		(DIA_Garond_PETZMASTER,"Ich habe nicht genug Gold!",DIA_Garond_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
	{
		Info_AddChoice 	(DIA_Garond_PETZMASTER,"Ich will die Strafe zahlen.",DIA_Garond_PETZMASTER_PayNow);
	};
};

func void DIA_Garond_PETZMASTER_PayNow()
{
	AI_Output (other, self, "DIA_Garond_PETZMASTER_PayNow_15_00"); //Ich will die Strafe zahlen!
	B_GiveInvItems (other, self, itmi_gold, Garond_Schulden);
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayNow_10_01"); //Gut, dann werde ich die Jungs wieder beruhigen. Aber mach so einen Schei� nie wieder!

	B_GrantAbsolution (LOC_OLDCAMP);
	
	Garond_Schulden			= 0;
	Garond_LastPetzCounter 	= 0;
	Garond_LastPetzCrime	= CRIME_NONE;
	
	Info_ClearChoices  	(DIA_Garond_PETZMASTER);
	Info_ClearChoices  	(DIA_Garond_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Garond_PETZMASTER_PayLater()
{
	AI_Output (other, self, "DIA_Garond_PETZMASTER_PayLater_15_00"); //Ich habe nicht genug Gold!
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayLater_10_01"); //Dann solltest du das Gold so schnell wie m�glich beschaffen.
	AI_Output (self, other, "DIA_Garond_PETZMASTER_PayLater_10_02"); //Und ich warne dich: Mach noch mehr �rger und es wird teurer f�r dich!
	
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
		AI_Output (self ,other,"DIA_Garond_Hello_10_00"); //Woher kommst du? Du geh�rst weder zu den Sch�rftruppen, noch zu meinen Leuten. Also?
		AI_Output (other ,self,"DIA_Garond_Hello_15_01"); //Ich bin �ber den Pass gekommen.
		AI_Output (self ,other,"DIA_Garond_Hello_10_02"); //�ber den Pass ...? Du hast es tats�chlich geschafft - bei Innos!
		
		if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_03"); //Warum hast du diesen Weg auf dich genommen, Magier?
		}
		else if (hero.guild == GIL_MIL)
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_04"); //Wie lautet dein Befehl, Soldat?
		}
		else
		{
			AI_Output (self ,other,"DIA_Garond_Hello_10_05"); //Ich frage mich, warum ein S�ldner das alles auf sich nimmt. Was willst du hier?
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
	description = "Ich komme von Lord Hagen. ";
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
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_00"); //Ich komme von Lord Hagen. Er will, dass ich ihm einen Beweis f�r die Anwesenheit der Drachen bringe.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_01"); //Und du bist hergekommen, um ihn dir abzuholen und wieder zu verschwinden?
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_02"); //So hatte ich mir das vorgestellt.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_03"); //Er will also einen Beweis? Den kann er haben. Aber ich kann dich nicht zu Lord Hagen zur�ckschicken, ohne ihm Auskunft �ber das Erz zu erteilen.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_04"); //H�r zu - Lord Hagen muss unbedingt erfahren, wie unsere Situation hier ist und wie viel Erz wir bisher gef�rdert haben.
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_05"); //Okay, was soll ich f�r dich tun?
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_06"); //Ich habe drei Sch�rftrupps da drau�en, aber die haben mir nicht einen Erzbrocken geschickt.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_07"); //Such die Sch�rfstellen auf und berichte mir, wie viel Erz sie gelagert haben.
	AI_Output (self ,other,"DIA_Garond_NeedProof_10_08"); //Dann werde ich ein Schreiben f�r dich aufsetzen, mit dem du zu Lord Hagen zur�ckkehren wirst.
	AI_Output (other,self ,"DIA_Garond_NeedProof_15_09"); //Na sch�n - sch�tze, mir bleibt keine Wahl.
	
	MIS_ScoutMine = LOG_RUNNING;
	B_StartOtherRoutine (Jergan,"FAJETH");
	
	B_LogEntry (TOPIC_MISOLDWORLD,"Bevor Komandant Garond mich zur�ckschickt, will er das ich die drei Sch�rftruppen aufsuche und ihm davon berichte, wieviel Erz sie dort gelagert haben.");
	
	Log_CreateTopic (TOPIC_ScoutMine,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_ScoutMine,LOG_RUNNING);
	
	B_LogEntry (TOPIC_ScoutMine,"Kommandant Garond hat mir eine Aufgabe zugewiesen. Er hat drei Sch�rftrupps auf die Suche nach dem magischen Erz geschickt. Bisher haben sie nichts geliefert. ");
	B_LogEntry (TOPIC_ScoutMine,"Ich soll die drei Sch�rftrupps aufsuchen und herausfinden, wieviel Erz sie gelagert haben.");

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
	description = "Aber warum ausgerechnet ich? ";
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
	AI_Output (other,self ,"DIA_Garond_Why_15_00"); //Aber warum ausgerechnet ich?
	AI_Output (self ,other,"DIA_Garond_Why_10_01"); //Weil du einen Weg durch die Orkreihen kennst. Meine Jungs w�ren da drau�en hoffnungslos verloren.
	AI_Output (self ,other,"DIA_Garond_Why_10_02"); //Du hast es hingegen schon einmal geschafft durchzukommen - das macht dich zum besten Mann f�r diesen Job.
};
// ************************************************************
// 			Ausr�stung
// ************************************************************

INSTANCE DIA_Garond_Equipment (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Equipment_Condition;
	information	= DIA_Garond_Equipment_Info;
	permanent	= FALSE;
	description = "Ich brauche Ausr�stung. ";
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
	AI_Output (other,self ,"DIA_Garond_Equipment_15_00"); //Ich brauche Ausr�stung.
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Garond_Equipment_10_01"); //Sprich mit dem Magier Milten hier in der Burg. Er kennt sich mit den Sachen aus, die du ben�tigen wirst.
	};
	if (other.guild == GIL_MIL)
	{
		AI_Output (self ,other,"DIA_Garond_Equipment_10_02"); //Kl�re das mit Tandor. Er wird dich mit allem versorgen, was du brauchst.
		
		Log_CreateTopic (TOPIC_Trader_OC,LOG_NOTE);
		B_LogEntry (TOPIC_Trader_OC,"Tandor handelt mit Waffen in der Burg.");
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
	description = "Wieviel zahlst du mir f�r den Job?";
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
	AI_Output (other,self ,"DIA_Garond_zahlen_15_00"); //Wieviel zahlst du mir f�r den Job?
	AI_Output (self ,other,"DIA_Garond_zahlen_10_01"); //(ver�rgert) Ich bin es nicht gewohnt, mit S�ldnern zu handeln.
	AI_Output (self ,other,"DIA_Garond_zahlen_10_02"); //Aber gut, mir bleibt wohl nicht keine andere Wahl. Ich zahle dir 500 Goldst�cke, wenn du die Mission f�r mich erledigst.
};
// ************************************************************
// 	Wo finde ich die Sch�rfstellen?
// ************************************************************

INSTANCE DIA_Garond_Wo (C_INFO)
{
	npc			= PAL_250_Garond;
	nr			= 4;
	condition	= DIA_Garond_Wo_Condition;
	information	= DIA_Garond_Wo_Info;
	permanent	= FALSE;
	description = "Wo finde ich die Sch�rfstellen?";
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
	AI_Output (other,self ,"DIA_Garond_Wo_15_00"); //Wo finde ich die Sch�rfstellen?
	AI_Output (self ,other,"DIA_Garond_Wo_10_01"); //Hier, nimm diese Karte. Dort sind die zwei Gebiete eingezeichnet, in denen sich die Sch�rfstellen befinden.
	
	CreateInvItems (self, ItWr_Map_OldWorld_Oremines_MIS, 1);									
	B_GiveInvItems (self, other, ItWr_Map_OldWorld_Oremines_MIS, 1);					

	AI_Output (self ,other,"DIA_Garond_Wo_10_02"); //Falls du noch weitere Fragen hast, wende dich an Parcival. Er wird dich mit allen Informationen �ber die Sch�rfer versorgen.
	
	B_LogEntry (TOPIC_ScoutMine,"Der Paladin Parcival kann mich mit Informationen �ber die Sch�rfer versorgen.");
};

FUNC VOID B_Garond_OreCounter3 ()
{		
	AI_Output (self ,other,"B_Garond_OreCounter3_10_00"); //Verdammt! Was ist da drau�en eigentlich los? Ist Beliar selbst gekommen, um uns zu vernichten?
	AI_Output (self ,other,"B_Garond_OreCounter3_10_01"); //Meine M�nner sind fast alle tot und mit dem bisschen Erz k�nnen wir NICHT MAL EINEN ORK AUFHALTEN - GESCHWEIGE DENN EINE ARMEE!
	AI_Output (self ,other,"B_Garond_OreCounter3_10_02"); //Diese Expedition ist zum Scheitern verurteilt.
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
	description = "Ich habe mit Fajeth gesprochen.";
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
	AI_Output (other,self ,"DIA_Garond_Fajeth_15_00"); //Ich habe mit Fajeth gesprochen.
	AI_Output (self ,other,"DIA_Garond_Fajeth_10_01"); //Was hat er mir mitzuteilen?
	AI_Output (other,self ,"DIA_Garond_Fajeth_15_02"); //Seine Leute haben zwei Kisten mit Erz gef�rdert.
	AI_Output (self ,other,"DIA_Garond_Fajeth_10_03"); //So ... zwei Kisten? Ich brauche aber keine zwei Kisten - ich brauche ZWEIHUNDERT Kisten.
 	AI_Output (other,self ,"DIA_Garond_Fajeth_15_04"); //Er l�sst dir ausrichten, dass er mehr M�nner braucht.
 	AI_Output (self ,other,"DIA_Garond_Fajeth_10_05"); //Was? Ich soll noch mehr M�nner in den sicheren Tod schicken? Das kann er vergessen.
 	
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
	description = "Wegen Silvestros Sch�rfstelle...";
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
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_00"); //Wegen Silvestros Sch�rfstelle...
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_01"); //Warst du bei ihm? Hast du ihn gesprochen?
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_02"); //Dort sind alle tot. Sie wurden wohl von Minecrawlern �berrascht.
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_03"); //Was ist mit dem Erz? Wei�t du, wie viel sie gesch�rft haben?
	AI_Output (other,self ,"DIA_Garond_Silvestro_15_04"); //Ein paar Kisten haben sie vorher in Sicherheit gebracht. Sie stehen in einer H�hle - auf dem Weg von der Burg zur Sch�rfstelle.
	AI_Output (self ,other,"DIA_Garond_Silvestro_10_05"); //Verdammt! Das waren viele gute M�nner - m�ge Innos sich ihrer Seelen annehmen.
	
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
	description = "Ich habe Marcos getroffen.";
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
	AI_Output (other,self ,"DIA_Garond_Marcos_15_00"); //Ich habe Marcos getroffen.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_01"); //Und? Was hat er zu berichten? Wie viel Erz stellt er uns zur Verf�gung?
	AI_Output (other,self ,"DIA_Garond_Marcos_15_02"); //Vier Kisten. Er hat die Sch�rfstelle verlassen, um das Erz in Sicherheit zu bringen.
	AI_Output (other,self ,"DIA_Garond_Marcos_15_03"); //Jetzt bewacht er die Kisten in einem kleinen Tal hinter den Reihen der Orks. Allerdings verlangt er nach Unterst�tzung.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_04"); //Was? Nur vier Kisten - und er hat seine Sch�rfstelle verlassen? Verdammt, das ist nicht gut.
	AI_Output (self ,other,"DIA_Garond_Marcos_10_05"); //Und jetzt verlangt er auch noch mehr M�nner ... ? Na sch�n, ich werde ihm zwei Leute schicken.
	
	
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
	description = "Was ist mit dem Schreiben f�r Lord Hagen?";
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
	AI_Output (other,self ,"DIA_Garond_Success_15_00"); //Was ist mit dem Schreiben f�r Lord Hagen?
	AI_Output (self ,other,"DIA_Garond_Success_10_01"); //Wir haben insgesamt zehn Kisten Erz - und mehr als doppelt soviele Verluste an guten M�nnern.
	AI_Output (self ,other,"DIA_Garond_Success_10_02"); //Du wirst dein Schreiben bekommen. Lord Hagen MUSS davon erfahren. Dieses Tal ist verflucht - das B�se ist hier.
	
	CreateInvItems (self,ItWr_PaladinLetter_MIS,1);
	B_GiveInvItems (self,other,ItWr_PaladinLetter_MIS,1);
	
	KnowsPaladins_Ore = TRUE;
	
	B_LogEntry (TOPIC_MISOLDWORLD,"Kommandant Garond hat mir einen Brief ausgeh�ndigt. Das wird als Beweis reichen. Damit kann ich zu Lord Hagen zur�ckkehren.");
	
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
	description = "Wie sieht's mit meiner Bezahlung aus?";
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
	AI_Output (other,self ,"DIA_Garond_SLD_15_00"); //Wie sieht's mit meiner Bezahlung aus?
	AI_Output (self ,other,"DIA_Garond_SLD_10_01"); //Ja, richtig. Du bekommst noch Gold von mir. Hier ist deine Belohnung.
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
	description = "Wie ist die Situation?";
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
	AI_Output (other,self ,"DIA_Garond_Running_15_00"); //Wie ist die Situation?
	
	if (Ore_Counter == 2) 
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_01"); //Jetzt fehlen mir nur noch die Nachrichten �ber die letzte Sch�rfstelle - und ich hoffe, es werden gute sein.
		
	}
	else if (Ore_Counter == 1) 
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_02"); //Ich brauche die Berichte �ber die anderen beiden Sch�rfstellen. Dann sehen wir weiter.
	}
	else //0
	{
		AI_Output (self ,other,"DIA_Garond_Running_10_03"); //Du solltest losziehen und die Sch�rfstellen aufsuchen. Ich brauche dringend Nachricht �ber den Stand der Erzf�rderung.
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
	description = "Ich will, da� du Gorn freil�sst.";
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
	AI_Output (other,self ,"DIA_Garond_Gorn_15_00"); //Ich will, da� du Gorn freil�sst.
	AI_Output (self ,other,"DIA_Garond_Gorn_10_01"); //Ich kann ihn nicht freilassen. Er hat sich vieler Verbrechen schuldig gemacht und die m�ssen ges�hnt werden.
	AI_Output (other,self ,"DIA_Garond_Gorn_15_02"); //Kann ich seine Strafe bezahlen?
	AI_Output (self ,other,"DIA_Garond_Gorn_10_03"); //Das w�re eine M�glichkeit - billig wird das allerdings nicht. Ich verlange 1000 Goldst�cke f�r Gorn.
	AI_Output (other,self ,"DIA_Garond_Gorn_15_04"); //Das ist ein Haufen Gold.
	AI_Output (self ,other,"DIA_Garond_Gorn_10_05"); //Gorn hat auch einiges auf dem Kerbholz. Bring mir das Gold, dann lasse ich Gorn frei.
	
	MIS_RescueGorn = LOG_RUNNING; 
	B_LogEntry (TOPIC_RescueGorn,"Garond verlangt eintausend Goldst�cke f�r die Freilassung von Gorn.");
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
	description = "Ich will Gorn freikaufen. (1000 Gold zahlen)";
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
	AI_Output (other,self ,"DIA_Garond_Pay_15_00"); //Ich will Gorn freikaufen.
	
	if B_GiveInvItems (other, self, ItMI_Gold, 1000)
	{
		AI_Output (self ,other,"DIA_Garond_Pay_10_01"); //Einverstanden. Du kannst zu Gerold gehen und ihm sagen, das Gorn auf meinen Befehl freigelassen wird.
		
		Garond_Kerkerauf = TRUE;
		B_LogEntry (TOPIC_RescueGorn,"Ich habe Garond bezahlt. Jetzt kann ich Gorn aus dem Knast holen. Der W�chter Gerold wird ihn freilassen. ");
	}
	else
	{
		AI_Output (self ,other,"DIA_Garond_Pay_10_02"); //Dann bring mir die 1000 Goldst�cke.
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
	description = "Was hast du jetzt vor?";
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
	AI_Output (other,self ,"DIA_Garond_Perm2_15_00"); //Was hast du jetzt vor?
	AI_Output (self ,other,"DIA_Garond_Perm2_10_01"); //Ich habe alles versucht. Meine Hoffnung ruht jetzt auf dir - und darauf, dass Lord Hagen mir Unterst�tzung schickt.
	AI_Output (self ,other,"DIA_Garond_Perm2_10_02"); //Wir werden weiterhin ausharren und zu Innos beten, auf dass er uns in diesen dunklen Stunden nicht mutlos werden l�sst.
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
	description	 = 	"Was gibt's Neues?";
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
	AI_Output (other, self, "DIA_Garond_WASGIBTSNEUES_15_00"); //Was gibt's Neues?
	AI_Output (self, other, "DIA_Garond_WASGIBTSNEUES_10_01"); //Verdammt noch mal. Was lungerst du hier rum? Ich brauche die verdammte Verst�rkung!
	AI_Output (self, other, "DIA_Garond_WASGIBTSNEUES_10_02"); //Sogar Milten hat die Burg verlassen. Ich brauche aber nicht weniger Leute - ich brauche mehr!
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
	description	 = 	"Ich bin zur�ck.";
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
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_00"); //Ich bin zur�ck.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_01"); //Das sehe ich selbst. Wo ist die Verst�rkung?
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_02"); //Lord Hagen kommt, sobald er alle Dinge erledigt hat. Es ist viel passiert.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_03"); //Interessiert mich nicht. Ich brauche Truppen. Die Orks werden immer mehr und wir k�nnen nicht mehr lange standhalten.
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_04"); //Meine M�nner sind m�de und die Vorr�te gehen zur Neige.
	AI_Output (other, self, "DIA_Garond_BACKINKAP4_15_05"); //Es sind einige Freiwillige eingetroffen.

	if (hero.guild == GIL_DJG)
	{
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_06"); //Du meinst dich und deine Drachenj�gerkollegen, was? Ihr k�nnt uns helfen, aber ihr seid einfach zu wenig.
	}
	else
	{
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_07"); //Du meinst die Drachenj�ger drau�en im Hof? Die k�nnen uns helfen, aber es sind einfach zu wenig.
	};
	AI_Output (self, other, "DIA_Garond_BACKINKAP4_10_08"); //Wenn Hagen nicht bald M�nner schickt, kann ich nichts garantieren.

	B_InitNpcGlobals ();//Joly: zur Sicherheit

	//	Angar wird zum Stonehenge geschickt
	//-----------------------------------------
	AI_Teleport 		 (DJG_Angar,"OW_DJG_WATCH_STONEHENGE_01");	
	B_StartOtherRoutine 	(DJG_Angar,"Start");
	DJG_Angar_SentToStones = TRUE;


	// Die Drachenj�ger vom Spielstart verziehen sich in ihr Lager.
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
	description	 = 	"Wegen der Drachen...";
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
	B_LogEntry (TOPIC_DRACHENJAGD,"Garond ist sicherlich daran interessiert, wie es um die Drachen steht, obwohl er auf mich eher den EIndruck macht, als w�re es ihm v�llig egal."); 

	if (Garond_DragonCounter < MIS_KilledDragons)
	{
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_00"); //Ich habe Neuigkeiten �ber die Drachen.
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_01"); //Berichte.
		
		var int CurrentDragonCount;
		var int Drachengeld;
		var int XP_LocalGarond;
		
		CurrentDragonCount = 0;	//Joly: funzt sonst nicht. Keine Ahnung warum!
	
		if (Npc_IsDead(Swampdragon))
		&& (Garond_SwampdragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_02"); //Ich habe den Drachen im Sumpf �stlich von hier get�tet.
			Garond_SwampdragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(Rockdragon))
		&& (Garond_RockdragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_03"); //Der Drache in der Felsenfestung im S�den ist tot.
			Garond_RockdragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(FireDragon))
		&& (Garond_FireDragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_04"); //Der Feuerdrache auf dem Vulkan im S�den wird keinen Schaden mehr anrichten.
			Garond_FireDragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};
		
		if (Npc_IsDead(Icedragon))
		&& (Garond_IcedragonKilled_OneTime == FALSE)
		{
			AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_05"); //Ich war in der westlichen Eisregion und habe den Eisdrachen dort zur Strecke gebracht.
			Garond_IcedragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};

		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_06"); //Das sind gute Neuigkeiten. Hier. Ich gebe dir etwas Geld f�r deine Ausr�stung.
		
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
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_07"); //Kannst du mir noch mehr Informationen �ber die Drachen geben?
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_08"); //Ich habe mich noch um andere Dinge zu k�mmern. Mein strategischer Offizier Oric kann dir mehr dazu sagen.
		B_LogEntry (TOPIC_DRACHENJAGD,"Garonds statigischer Offizier Oric hat veilleicht einige n�tzliche Informationen f�r mich."); 
		Garond_OricExperte_OneTime = TRUE;
	}
	else if (MIS_AllDragonsDead == FALSE)
	{
		AI_Output (other, self, "DIA_Garond_DragonPlettBericht_15_09"); //Hat es inzwischen wieder Angriffe der Drachen gegeben?
		AI_Output (self, other, "DIA_Garond_DragonPlettBericht_10_10"); //Zum Gl�ck nicht. Im Moment halten sie sich zur�ck.
	};
};

//*********************************************************************
//	Ich habe alle drachen get�tet
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
	description	 = 	"Alle Drachen sind tot.";
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
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_00"); //Alle Drachen sind tot.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_01"); //(ungl�ubig) Alle? Das B�se ist also entg�ltig besiegt?
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_02"); //Nein, leider noch nicht. Es gibt da noch ihren Anf�hrer.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_03"); //Waren die Drachen nicht die Anf�hrer der Orks?
	AI_Output (other, self, "DIA_Garond_AllDragonDead_15_04"); //Ja schon, aber auch sie haben ihren Meister. Wir m�ssen auch ihn beseitigen.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_05"); //Ich kann hier verdammt noch mal nicht weg. Ich muss das Erz sichern und die verfluchten Orks sind auch noch da.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_06"); //Du musst dich alleine darum k�mmern. Ich kann dir nicht helfen.
	AI_Output (self, other, "DIA_Garond_AllDragonDead_10_07"); //M�ge Innos dich sch�tzen.
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
	description	= 	"Es gibt ein Problem mit dem Schmied.";
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
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_00"); //Es gibt ein Problem mit dem Schmied.
	AI_Output			(self ,other, "DIA_Garond_JanBecomeSmith_10_01"); //Welcher Schmied? Der hat sich aus dem Staub gemacht.
	AI_Output			(self ,other, "DIA_Garond_JanBecomeSmith_10_02"); //Ist er wieder da? Dann kannst du ihm ausrichten ...
	AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_03"); //Nein, ich meine Jan.

	if (hero.guild == GIL_DJG)
	{
		AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_04"); //Er ist Drachenj�ger, so wie ich, und ein guter Schmied.
	}
	else
	{
		AI_Output			(other,self , "DIA_Garond_JanBecomeSmith_15_05"); //Einer der Drachenj�ger. Er ist Schmied.
	};	

	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_06"); //Das trifft sich ja gut, unser ehemaliger Schmied hat sich einfach verdr�ckt, dieser Feigling.
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_07"); //Jan w�re bereit, die Schmiede zu �bernehmen.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_08"); //Verstehe. Du meinst also, ich kann ihm trauen.
	AI_Output			(other, self, "DIA_Garond_JanBecomeSmith_15_09"); //Ja.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_10"); //Wenn du dir so sicher bist, dann wirst du f�r ihn b�rgen.
	AI_Output			(self, other, "DIA_Garond_JanBecomeSmith_10_11"); //Sollte er �rger machen, wirst du daf�r geradestehen. Einverstanden?
	
	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
	Info_AddChoice 		(DIA_Garond_JanBecomeSmith,"Ich �berleg mir das noch mal.",DIA_Garond_JanBecomeSmith_No);
	Info_AddChoice		(DIA_Garond_JanBecomeSmith,"Ich b�rge f�r Jan.",DIA_Garond_JanBecomeSmith_Yes); 		
};

FUNC VOID DIA_Garond_JanBecomeSmith_No ()
{
	AI_Output (other,self ,"DIA_Garond_JanBecomeSmith_No_15_00"); //Ich �berleg mir das noch mal.
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_No_10_01"); //Wieso sollte ich ihm trauen, wenn du es noch nicht einmal tust?
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_No_10_02"); //Ohne einen B�rgen wird dieser Jan seine Finger von der Schmiede lassen.

	Info_ClearChoices 	(DIA_Garond_JanBecomeSmith);
};

FUNC VOID DIA_Garond_JanBecomeSmith_Yes()
{
	AI_Output (other,self ,"DIA_Garond_JanBecomeSmith_Yes_15_00"); //Ich b�rge f�r Jan.
	AI_Output (self ,other,"DIA_Garond_JanBecomeSmith_Yes_10_01"); //Also gut, er kann die Schmiede benutzen. Allerdings wird er dann auch meine Soldaten mit Klingen versorgen m�ssen.
	
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

	description	 = 	"Wie ist die Lage?";
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
	AI_Output			(other, self, "DIA_Garond_PERM5_15_00"); //Wie ist die Lage?

	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output			(self, other, "DIA_Garond_PERM5_10_01"); //Verdammte Sauerei! Irgendein Dreckskerl hat das Haupttor ge�ffnet. Jetzt sind wir nichts weiter als Futter f�r die W�lfe.
	AI_Output			(self, other, "DIA_Garond_PERM5_10_02"); //Wenn ich den Verr�ter zu fassen kriege ...
	}
	else
	{
	AI_Output			(self, other, "DIA_Garond_PERM5_10_03"); //Wir verrecken hier alle wie die Fliegen, wenn Hagen nicht bald kommt.
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
































