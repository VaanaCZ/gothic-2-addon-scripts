//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_EXIT   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 999;
	condition   = DIA_Addon_Thorus_EXIT_Condition;
	information = DIA_Addon_Thorus_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Thorus_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Thorus_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Hi   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 2;
	condition   = DIA_Addon_Thorus_Hi_Condition;
	information = DIA_Addon_Thorus_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Thorus_Hi_Condition()
{	
	if (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Hi_Info()
{	
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_00");//Du kennst die Regel. Ohne rote Steintafel kommt keiner in die Mine.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Hi_15_01");//Vergiss die Mine - ich muss zu Raven.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_02");//Selbst wenn. Wir haben hier Regeln und die gelten für alle. Auch für dich.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_03");//Kehr wieder um. Wenn du versuchst, ohne Erlaubnis den oberen Platz zu betreten, werden die anderen Gardisten dich umbringen. DAS sind die Regeln.
	
	if !Npc_IsDead (Esteban)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_04");//Wenn du was zu beanstanden hast, geh und sprich mit Esteban. Er ist für das Lager zuständig.
	};
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "START");
};
//----------------------------------------------------------------------
//	Info Raven
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Raven   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 3;
	condition   = DIA_Addon_Thorus_Raven_Condition;
	information = DIA_Addon_Thorus_Raven_Info;
	permanent   = FALSE;
	description = "Es ist wichtig, das ich Raven erreiche...";
};
FUNC INT DIA_Addon_Thorus_Raven_Condition()
{	
	if (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Raven_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raven_15_00");//Es ist wichtig, dass ich Raven erreiche ...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_01");//Ach ja? Glaubst du etwa du kannst bis zu ihm vordringen?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_02");//Seine Garde hat Anordnung, NIEMANDEN vorzulassen. Du wärst tot, bevor du ihn auch nur zu Gesicht bekommen würdest.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_03");//Also schlag dir das aus dem Kopf.

	Log_CreateTopic (TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RavenKDW,"Raven ist der Anführer der Banditen. Ich werde einige von ihnen aus dem Weg räumen müssen, um zu ihm zu gelangen."); 
};
//----------------------------------------------------------------------
//	Info Zeit
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Zeit   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 4;
	condition   = DIA_Addon_Thorus_Zeit_Condition;
	information = DIA_Addon_Thorus_Zeit_Info;
	permanent   = FALSE;
	description = "Erkennst du mich nicht? Aus dem alten Lager?";
};
FUNC INT DIA_Addon_Thorus_Zeit_Condition()
{	
	if (RavenIsDead == FALSE) 
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Zeit_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Zeit_15_00");//Erkennst du mich nicht? Aus dem alten Lager ...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_01");//Du bist einer der Gefangenen?! Vielleicht warst du einer meiner Gardisten. Und? Macht uns das jetzt zu Verbündeten?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_02");//Nein, das macht es uns nicht.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_03");//Vielleicht bist du der Typ, der die Barriere zum Einsturz gebracht hat - vielleicht hast du auch meine Kumpels umgebracht.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_04");//Na und?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_05");//Die Zeiten sind vorbei.
	
	if !Npc_IsDead (Esteban)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_06");//Du willst rein? Dann besorg dir einen roten Stein und verschwende nicht meine Zeit.
	};
};

//----------------------------------------------------------------------
//	Die guten alten Zeiten
//----------------------------------------------------------------------
var int Thorus_GoodOldPerm;
//----------------------------------------------------------------------
instance DIA_Addon_BDT_10014_Thorus_GoodOldPerm  (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 4;
	condition   = DIA_Addon_Thorus_GoodOldPerm_Condition;
	information = DIA_Addon_Thorus_GoodOldPerm_Info;
	permanent   = TRUE;
	description = "Komm, lass mich rein. Um der guten alten Zeiten Willen.";
};
FUNC INT DIA_Addon_Thorus_GoodOldPerm_Condition()
{	
	if (MIS_Send_Buddler != LOG_SUCCESS)
	&& (Npc_KnowsInfo (other, DIA_Addon_BDT_10014_Thorus_Zeit))
	&& (RavenIsDead == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_GoodOldPerm_Info()
{	
	AI_Output (other, self, "DIA_Addon_Thorus_Add_15_00"); //Komm, lass mich rein. Um der guten alten Zeiten Willen.
	if (Thorus_GoodOldPerm == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_01"); //Jetzt will ich dir mal was erklären. Weißt du, warum ich noch am Leben bin?
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_02"); //Weil ich immer zu meinen Leuten loyal war.
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_03"); //Ich muß nicht mit allem einverstanden sein, was Raven tut. Aber ich werde mich an die Regeln halten. 
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_04"); //Und das wirst du auch!
		Thorus_GoodOldPerm = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Add_12_05"); //(bestimmt) Nein!
	};
};

//----------------------------------------------------------------------
//Abfrage auf alle Tokens bis auf den ROTEN 
//----------------------------------------------------------------------
FUNC INT C_PlayerHasWrongToken ()
{
	if (C_ScHasMagicStonePlate () == TRUE)
	|| (Npc_HasItems (hero, ItWr_StonePlateCommon_Addon) >= 1)//Klar.
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_02) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_03) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_04) >= 1)
	|| (Npc_HasItems (hero, ItMi_Addon_Stone_05) >= 1)
	{
		return TRUE;
	};
	return FALSE;
};
//----------------------------------------------------------------------
//	Info Stein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Stein   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Stein_Condition;
	information = DIA_Addon_Thorus_Stein_Info;
	permanent   = TRUE;
	description = "Ich habe hier eine Steintafel für dich ...";
};
FUNC INT DIA_Addon_Thorus_Stein_Condition()
{	
	if (C_PlayerHasWrongToken () == TRUE)
	&& (RavenIsDead == FALSE)
	&& (MIS_Send_Buddler != LOG_RUNNING)
	&& (MIS_Send_Buddler != LOG_SUCCESS)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Stein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Stein_15_00");//Ich habe hier eine Steintafel für dich ...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Stein_12_01");//Du hast nicht den richtigen Stein. Nur die Roten sind von Bedeutung.
};
//----------------------------------------------------------------------
//	Info Rein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Rein   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Rein_Condition;
	information = DIA_Addon_Thorus_Rein_Info;
	permanent   = FALSE;
	description = "Ich habe hier eine rote Steintafel ...";
};
FUNC INT DIA_Addon_Thorus_Rein_Condition()
{	
	if (Npc_HasItems (other, ItMi_Addon_Stone_01) >= 1)
	&& (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Rein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_00");//Ich habe hier eine rote Steintafel ...
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_01");//Okay.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_02");//Du hast Esteban erledigt - dann wirst DU jetzt seinen Job machen.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_03");//In der Mine haben sie ein paar Probleme mit Minecrawlern.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_04");//Drei Buddler hat's bereits erwischt. Es ist deine Aufgabe, für Nachschub zu sorgen.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_05");//Und wann kann ich endlich in die verdammte Mine?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_06");//Mach deinen Job - danach kannst du machen, was du willst.
	
	MIS_Send_Buddler = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Buddler,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Buddler, LOG_RUNNING);
	B_LogEntry (Topic_Addon_Buddler,"Da ich nun Estebans Aufgabe übernommen habe, soll ich drei Buddler in die Mine schicken.");
};
//----------------------------------------------------------------------
//	Info drei typen losgeschickt
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Sent   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 9;
	condition   = DIA_Addon_Thorus_Sent_Condition;
	information = DIA_Addon_Thorus_Sent_Info;
	permanent   = FALSE;
	description = "Ich habe drei Kerle losgeschickt.";
};
FUNC INT DIA_Addon_Thorus_Sent_Condition()
{	
	if (Player_SentBuddler >= 3)
	&& (RavenIsDead == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Sent_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Sent_15_00");//Ich habe drei Kerle losgeschickt.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Sent_12_01");//Alles klar. Dann kannst du wegen mir rein.

	MIS_Send_Buddler = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
};
//----------------------------------------------------------------------
//	Info Armor
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_Armor   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Armor_Condition;
	information = DIA_Addon_Thorus_Armor_Info;
	permanent   = FALSE;
	description = "Hey, was ist mit deiner Rüstung? Wo kriege ich so eine Rüstung her?";
};
FUNC INT DIA_Addon_Thorus_Armor_Condition()
{	
	if (RavenIsDead == FALSE)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Armor_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Armor_15_00");//Hey, was ist mit deiner Rüstung? Wo kriege ich so eine Rüstung her?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_01");//Gar nicht. Die Rüstungen sind Ravens Garde vorbehalten.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_02");//Ich glaube kaum, dass es eine Aufnahmeprüfung für neue Anwärter gibt. Aber letztendlich liegt die Entscheidung nicht bei mir, sondern bei Raven.
};
//----------------------------------------------------------------------
//	Info Gefangene
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Gefangene   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 88;
	condition   = DIA_Addon_Thorus_Gefangene_Condition;
	information = DIA_Addon_Thorus_Gefangene_Info;
	permanent   = FALSE;
	description = "Wie sieht's mit den Gefangenen aus?";
};
FUNC INT DIA_Addon_Thorus_Gefangene_Condition()
{	
	if !Npc_IsDead (Bloodwyn)
	&&  Npc_KnowsInfo (other,DIA_Addon_Patrick_Hi)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Gefangene_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_00");//Wie sieht's mit den Gefangenen aus?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_01");//Mmh, ihre Arbeit haben sie erledigt. Soweit ich weiß, sollen sie jetzt Gold hacken.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_02");//Und wenn sie abhauen würden ...?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_03");//... würde Bloodwyn seine Garde hinterher schicken. Aber ich glaube auch kaum, dass sie verrückt genug wären, einen Fluchtversuch zu wagen.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_04");//Es sei denn ...
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_05");//Es sei denn, was?
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_06");//... jemand anders würde sie dazu anstiften. Aber ich kenne niemanden, der dumm genug wäre, das zu tun ... jedenfalls solange Bloodwyn hier ist.
	B_Say (other, self,"$VERSTEHE");
};
//----------------------------------------------------------------------
//	Info Speech
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Speech   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Speech_Condition;
	information = DIA_Addon_Thorus_Speech_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Thorus_Speech_Condition()
{	
	if Npc_IsDead (Bloodwyn)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Speech_Info()
{	
	
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_00");//Was hast du eigentlich vor?
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_01");//Was??
	
	if (RavenIsDead == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_02");//Du hast jetzt auch noch Bloodwyn aus dem Weg geräumt. Ich frag mich nur, wer der nächste ist. Raven? Oder ich?
		AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_03");//Hast du Angst?
		AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_04");//Vor einem Kampf fürchte ich mich nicht. Aber vor den Konsequenzen deiner Taten.
	};
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_05");//Dieses Lager ist das Einzige, was uns noch geblieben ist.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_06");//Es hat vielleicht nicht zur Zufriedenheit aller funktioniert, aber es HAT funktioniert.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_07");//Und mit jedem, den du tötest, bricht ein Stück unserer Gemeinschaft auseinander.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_08");//Wir sind Banditen. Ausgeschlossene, Gesetzlose, Verachtete.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_09");//Wo wir auch hingehen, man wird uns jagen, einsperren und töten.
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_10");//Es gibt keinen besseren Ort für uns als diesen, keine bessere Zeit als jetzt.
	AI_Output (other, self, "DIA_Addon_Thorus_Speech_15_11");//Worauf willst du hinaus?
	AI_Output (self, other, "DIA_Addon_Thorus_Speech_12_12");//Diese Männer brauchen jemanden, der sie führt. Wer soll das machen? Du? Du, der ständig von Ort zu Ort zieht?
};
//----------------------------------------------------------------------
//	Info Answer
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Answer   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Answer_Condition;
	information = DIA_Addon_Thorus_Answer_Info;
	permanent   = FALSE;
	description = "Dann übernimm du doch die Führung des Lagers. ";
};
FUNC INT DIA_Addon_Thorus_Answer_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Speech)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Answer_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_00");//Dann übernimm du doch die Führung des Lagers.
	
	if (RavenIsDead == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_01");//Okay, aber was ist mit Raven?
		AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_02");//Raven wird bald ganz andere Sorgen haben. Ich werde mich um ihn kümmern.
	};
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_03");//Ach ja, und sorg dafür, dass die Gefangenen das Lager unbehelligt verlassen können.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_04");//Geht klar. Ich werde mich um alle Wachen hier draußen kümmern.
	
	B_LogEntry (Topic_Addon_Sklaven,"Bloodwyn ist tot und Thorus wird dafür sorgen das die Sklaven das Lager verlassen können."); 
	
	if !Npc_IsDead (PrisonGuard)
	{
		B_LogEntry (Topic_Addon_Sklaven,"Jetzt rede ich noch einmal mit der 'Sklaven Wache', dann kann Patrick mit seinen Jungs abhauen. "); 
	}
	else
	{
		B_LogEntry (Topic_Addon_Sklaven,"Da die 'Sklaven Wache' auch erledigt ist, kann Patrick jetzt mit seinen Jungs abhauen."); 
	};
};
//----------------------------------------------------------------------
//	Info Raventot
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Thorus_Raventot   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 99;
	condition   = DIA_Addon_Thorus_Raventot_Condition;
	information = DIA_Addon_Thorus_Raventot_Info;
	permanent   = FALSE;
	description = "Ich hab's geschafft. Raven ist erledigt.";
};
FUNC INT DIA_Addon_Thorus_Raventot_Condition()
{	
	if (RavenIsDead == TRUE)
	{		
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Thorus_Raventot_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_00");//Ich hab's geschafft. Raven ist erledigt.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_01");//Damit hast du Beliar einen kräftigen Tritt verpasst.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_02");//Dann wirst du jetzt weiter ziehen?
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_03");//Meine Aufgabe in diesem Tal ist beendet. Ich könnte mich mal ein paar Tage ausruhen.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_04");//(lacht) Ja, du bist ständig unterwegs, was? (ernst) Ich wünsche dir eine gute Reise.
	AI_Output (other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_05");//Wer weiß, vielleicht laufen wir uns nochmal über'n Weg.
	AI_Output (self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_06");//Wer weiß. Es gibt eine Menge Tore und Durchgänge, die du durchqueren wirst. Und an einem solchen wirst du mich finden ...
	
	AI_StopProcessInfos (self);
	
};



