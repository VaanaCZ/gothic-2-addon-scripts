//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_EXIT   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 999;
	condition   = DIA_Addon_Esteban_EXIT_Condition;
	information = DIA_Addon_Esteban_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Esteban_EXIT_Condition()
{	
	if (Bodyguard_Killer == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Esteban_PICKPOCKET (C_INFO)
{
	npc			= BDT_1083_Addon_Esteban;
	nr			= 900;
	condition	= DIA_Addon_Esteban_PICKPOCKET_Condition;
	information	= DIA_Addon_Esteban_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Addon_Esteban_PICKPOCKET_Condition()
{
	C_Beklauen (105, 500);
};
 
FUNC VOID DIA_Addon_Esteban_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Esteban_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Esteban_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Esteban_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Esteban_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Esteban_PICKPOCKET_DoIt);
};

func void DIA_Addon_Esteban_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Esteban_PICKPOCKET);
};
	
func void DIA_Addon_Esteban_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Esteban_PICKPOCKET);
};
//--------------------------------------------------------------------
//	Info Hi
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Hi   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 2;
	condition   = DIA_Addon_Esteban_Hi_Condition;
	information = DIA_Addon_Esteban_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Esteban_Hi_Condition()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_00");//Du bist also der Kerl, der sich ins Lager gekämpft hat.
	AI_Output (other, self, "DIA_Addon_Esteban_Hi_15_01");//Das hat sich ja schnell rumgesprochen ...
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_02");//Franco war 'ne harte Nuss. Niemand hat sich mit ihm angelegt. Niemand - außer dir.
	AI_Output (self, other, "DIA_Addon_Esteban_Hi_07_03");//Nur damit das klar ist, wenn du versuchst, den gleichen Scheiß bei mir abzuziehen, dann mache ich dich fertig.
};
//--------------------------------------------------------------------
//	Info Mine
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Mine   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 3;
	condition   = DIA_Addon_Esteban_Mine_Condition;
	information = DIA_Addon_Esteban_Mine_Info;
	permanent   = FALSE;
	description = "Ich will in die Mine!";
};
FUNC INT DIA_Addon_Esteban_Mine_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Hi)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Mine_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Mine_15_00");//Ich will in die Mine!
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_01");//(grinst) Natürlich willst du das. Da bist du bei mir genau richtig.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_02");//Denn jeder, der in der Mine schürft, darf einen fetten Anteil vom Gold behalten.
	AI_Output (self, other, "DIA_Addon_Esteban_Mine_07_03");//Und ich verteile die roten Steine, die du brauchst, damit Thorus dich durchlässt.
};
//--------------------------------------------------------------------
//	Info Rot
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Rot   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 3;
	condition   = DIA_Addon_Esteban_Rot_Condition;
	information = DIA_Addon_Esteban_Rot_Info;
	permanent   = FALSE;
	description = "Gib mir so einen roten Stein.";
};
FUNC INT DIA_Addon_Esteban_Rot_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Mine)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Rot_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Rot_15_00");//Gib mir so einen roten Stein.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_01");//Okay, aber den gibt's nicht umsonst.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_02");//Für gewöhnlich verlange ich einen Teil des Goldes, den die Jungs für's Schürfen bekommen.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_03");//(abschätzend) Wie sieht's denn mit deinen Kenntnissen über's Goldhacken aus, hm?
	if (Hero_HackChance > 25) 
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_04");//Du hast dir schon ein paar Tricks erzählen lassen, was?
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_05");//Du verstehst ja nicht gerade viel davon ...
	};
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_06");//(abfällig) Wenn ich dir einen roten Stein gebe, dann nicht, weil du so ein toller Buddler bist.
	AI_Output (self, other, "DIA_Addon_Esteban_Rot_07_07");//Nein, für dich habe eine andere Aufgabe ...
	
};
//--------------------------------------------------------------------
//	Info MIS
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_MIS   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 4;
	condition   = DIA_Addon_Esteban_MIS_Condition;
	information = DIA_Addon_Esteban_MIS_Info;
	permanent   = FALSE;
	description = "Was für eine Aufgabe ist das?";
};
FUNC INT DIA_Addon_Esteban_MIS_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Rot)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_MIS_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_00");//Was für eine Aufgabe ist das?
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_01");//Einer der Banditen hatte vor, mich zu töten. Aber stattdessen haben meine Wachen IHN getötet.
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_02");//Er war wohl scharf auf deinen Posten, was?
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_03");//Er war ein Idiot! Ein Schläger ohne Verstand. Von alleine wäre er nie auf die Idee gekommen, sich mit mir anzulegen.
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_04");//Nein, er hat den Auftrag nur ausgeführt - geschickt wurde er von jemand anders ...
	AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_05");//Ich soll also rausfinden, wer dahinter steckt.
	AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_06");//Wer auch immer mir diesen Attentäter geschickt hat, er muss dafür bezahlen. Finde ihn - und ich lasse dich in die Mine.
	
	if !Npc_IsDead (Senyan)
	&&  Npc_KnowsInfo (other,DIA_Addon_BDT_1084_Senyan_Hi)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_MIS_15_07");//Wegen dieser Sache hat Senyan mich zu dir geschickt.
		AI_Output (self, other, "DIA_Addon_Esteban_MIS_07_08");//Senyan? Er arbeitet auch für mich. Ich habe ihm gesagt, er soll die Augen aufhalten.
	};
	
	MIS_Judas = LOG_RUNNING;
	Log_CreateTopic (Topic_Addon_Esteban,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Esteban,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Esteban, "Auf Esteban wurde ein Attentat verübt. Ich soll herausfinden, wer dahinter steckt.");

};
//--------------------------------------------------------------------
//	Info Attentäter (Kerl)
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Kerl   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Kerl_Condition;
	information = DIA_Addon_Esteban_Kerl_Info;
	permanent   = FALSE;
	description = "Wie soll ich vorgehen?";
};
FUNC INT DIA_Addon_Esteban_Kerl_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Kerl_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Kerl_15_00");//Wie soll ich vorgehen?
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_01");//Jeder hier im Lager weiß davon. Du spielst also mit offenen Karten.
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_02");//Versuche rauszufinden, wer auf meiner Seite steht und wer nicht und lass dich nicht von den Kerlen verarschen!
	AI_Output (self, other, "DIA_Addon_Esteban_Kerl_07_03");//Sprich mit Snaf. Der dicke Koch kriegt 'ne Menge mit.
	
	B_LogEntry (Topic_Addon_Esteban, "Um den Auftraggeber ausfindig zu machen, sollte ich mit allen Leuten im Lager sprechen und herausfinden auf wessen Seite sie stehen. Snaf ist 'ne gute Anlaufstelle, weil er 'ne Menge mitkriegt.");
};
//--------------------------------------------------------------------
//	Info Armor 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Armor   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 9;
	condition   = DIA_Addon_Esteban_Armor_Condition;
	information = DIA_Addon_Esteban_Armor_Info;
	permanent   = FALSE;
	description = "Ich brauche 'ne bessere Rüstung. ";
};
FUNC INT DIA_Addon_Esteban_Armor_Condition()
{	
	if (Huno_ArmorCheap == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Armor_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Armor_15_00"); //Ich brauch 'ne bessere Rüstung.
	AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_01"); //Wieso? Du hast doch schon eine. Die ist für's erste gut genug für dich!
	if (MIS_Judas == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Armor_07_02"); //Wenn du deinen Auftrag erledigt hast, reden wir noch mal darüber ...
	};
};
//--------------------------------------------------------------------
//	Info Auftrag
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Auftrag   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 99;
	condition   = DIA_Addon_Esteban_Auftrag_Condition;
	information = DIA_Addon_Esteban_Auftrag_Info;
	permanent   = TRUE;
	description = "Wegen dem Auftrag ...";
};
FUNC INT DIA_Addon_Esteban_Auftrag_Condition()
{	
	if ((MIS_Judas == LOG_RUNNING)
	|| (MIS_Judas == LOG_SUCCESS))
	&& (Bodyguard_Killer == FALSE)	
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Auftrag_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_00");//Wegen des Auftrags ...
	AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_01");//Pass auf, ich hab noch andere Sachen, um die ich mich kümmern muss.
	
	if (MIS_Judas == LOG_SUCCESS)
	{
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_02");//Ich dachte, es interessiert dich vielleicht, wer hinter dem Attentat steckt ...
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_03");//Wer ist es? Sag mir seinen Namen, damit meine Wachen ihm den Hals umdrehen können ...
		AI_Output (other, self, "DIA_Addon_Esteban_Auftrag_15_04");//Der Händler Fisk steckt dahinter. Zur Zeit steht er allerdings ahnungslos in der Kneipe und säuft ...
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_05");//HA! Gut gemacht, Kleiner. Meine Wachen werden sich um ihn kümmern ...
		
		AI_TurnToNpc (self, Wache_01);
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_06");//Ihr habt's gehört Jungs. Schnappt euch diesen Fisk.
		AI_TurnToNpc (self, other);
		
		Bodyguard_Killer = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Esteban_Auftrag_07_07");//Komm wieder, wenn du rausgefunden hast, wer der Kerl ist.
		AI_StopProcessInfos(self);
	};
};	
//--------------------------------------------------------------------
//	Info Guards Away
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Away   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Away_Condition;
	information = DIA_Addon_Esteban_Away_Info;
	permanent   = FALSE;
	description = "Und wie geht's jetzt weiter?";
};
FUNC INT DIA_Addon_Esteban_Away_Condition()
{	
	if (Bodyguard_Killer == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Away_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Away_15_00");//Und wie geht's jetzt weiter?
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_01");//Wie es jetzt weitergeht? Ich sage dir, wie es weitergeht.
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_02");//Fisk ist wird einen schmerzvollen Tod erleiden. Und jeder im Lager wird davon erfahren.
	AI_Output (self, other, "DIA_Addon_Esteban_Away_07_03");//Das wird ihnen allen eine Warnung sein.
	
	B_StartotherRoutine (Wache_01,"AMBUSH");
	B_StartotherRoutine (Wache_02,"AMBUSH");
};
//--------------------------------------------------------------------
//	Info Stone
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Stone   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_Stone_Condition;
	information = DIA_Addon_Esteban_Stone_Info;
	permanent   = FALSE;
	description = "Kriege ich jetzt einen roten Stein?";
};
FUNC INT DIA_Addon_Esteban_Stone_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Esteban_Away)
	&& (Bodyguard_Killer == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Stone_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_Stone_15_00");//Kriege ich jetzt einen roten Stein?
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_01");//Du hast deine Sache gut gemacht. Jemand wie du hat in der Mine nichts verloren.
	AI_Output (self, other, "DIA_Addon_Esteban_Stone_07_02");//Ich kann dich hier viel besser gebrauchen. Du wirst im Lager bleiben und weiterhin für mich arbeiten.
};		
//--------------------------------------------------------------------
//	Info nicht arbeiten
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_not   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 5;
	condition   = DIA_Addon_Esteban_not_Condition;
	information = DIA_Addon_Esteban_not_Info;
	permanent   = FALSE;
	description = "Ich denk' darüber nach.";
};
FUNC INT DIA_Addon_Esteban_not_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Stone)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_not_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_not_15_00");//Ich denk' darüber nach.
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_01");//Du vergisst, vor wem du stehst. Ich habe hier das Sagen und du wirst genau das tun, was ich dir sage.
	AI_Output (self, other, "DIA_Addon_Esteban_not_07_02");//Und ich sage, du arbeitest für mich und niemanden sonst. Ist das jetzt klar?
};
//--------------------------------------------------------------------
//	Info Leibwache weg (fight)
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_fight   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 6;
	condition   = DIA_Addon_Esteban_fight_Condition;
	information = DIA_Addon_Esteban_fight_Info;
	permanent   = FALSE;
	description = "Willst du mich verarschen?";
};
FUNC INT DIA_Addon_Esteban_fight_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Esteban_Stone)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_fight_Info()
{
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_00");//Willst du mich verarschen? Es war nie die Rede davon, dass ich für dich arbeite.
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_01");//So ein Angebot bekommt nicht jeder. Aber wenn du nicht willst, steht es dir auch frei, das Lager zu verlassen ...
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_02");//Wie wäre es, wenn du dein Wort hältst und mir einen roten Stein gibst?
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_03");//Hey - noch ein Wort und meine Wachen müssen dir auch noch weh tun.
	AI_Output (other, self, "DIA_Addon_Esteban_fight_15_04");//(grinst) Welche Wachen ... ?
	AI_Output (self, other, "DIA_Addon_Esteban_fight_07_05");//Was ... ? Ah, ich verstehe ... du versuchst mich reinzulegen, na warte ...
	
	Bodyguard_Killer = FALSE;
	
	B_KillNpc (Wache_01);
	B_KillNpc (Wache_02);
		
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
//---------------------------------------------------------------------
//	Info Duell
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Esteban_Duell   (C_INFO)
{
	npc         = BDT_1083_Addon_Esteban;
	nr          = 99;
	condition   = DIA_Addon_Esteban_Duell_Condition;
	information = DIA_Addon_Esteban_Duell_Info;
	permanent   = FALSE;
	description = "Gib mir JETZT den Stein oder ich werde ihn mir holen!";
};
FUNC INT DIA_Addon_Esteban_Duell_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Esteban_Rot))
	&& (Bodyguard_Killer != TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Esteban_Duell_Info()
{	
	AI_Output (other,self,"DIA_Addon_Esteban_Duell_15_00"); //Gib mir JETZT den Stein oder ich werde ihn mir holen!
	AI_Output (self,other,"DIA_Addon_Esteban_Duell_07_01"); //Oh, du bist lebensmüde. Na schön, ich tu dir den Gefallen und erlöse dich von deiner Dummheit!
	
	AI_StopProcessInfos(self);
	B_Attack (self, other, AR_NONE, 1);
};




