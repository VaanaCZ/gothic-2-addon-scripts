//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_EXIT   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 999;
	condition   = DIA_Addon_10023_Wache_EXIT_Condition;
	information = DIA_Addon_10023_Wache_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_10023_Wache_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_10023_Wache_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_Hi   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 2;
	condition   = DIA_Addon_10023_Wache_Hi_Condition;
	information = DIA_Addon_10023_Wache_Hi_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_10023_Wache_Hi_Condition()
{	
	if (Npc_GetDistToNpc (self,other) <= 300)
	{		
		return TRUE;
	};
};
FUNC VOID DIA_Addon_10023_Wache_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_00");//Hey, wo willst du hin? Willst du in diesen Gang?
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_01");//Naja, warum nicht?
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_02");//Dahinten sind noch mehr Sklaven. Wegen mir kannst du rein, aber schlag sie nicht so fest, dass sie nicht mehr arbeiten können.
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_03");//Schließlich wollen wir ja nicht, dass sie hier nur noch rumsitzen. Sie müssen Gold hacken.
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_04");//Verstehe. Und wer hat das angeordnet?
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_05");//Das ist ein direkter Befehl von Bloodwyn.
	AI_Output (other, self, "DIA_Addon_10023_Wache_Hi_15_06");//Ich dachte, Raven wäre hier der Chef.
	AI_Output (self, other, "DIA_Addon_10023_Wache_Hi_11_07");//Richtig - aber er hat die Sklaven Bloodwyn geschenkt. Er hat wohl keine Verwendung mehr für sie.
	
	Pardos.attribute[ATR_HITPOINTS] 		= 70;
	B_LogEntry (Topic_Addon_Sklaven,"Raven hat keine Verwendung mehr für die Sklaven. Sie unterstehen jetzt Bloodwyn."); 
};
//---------------------------------------------------------------------
//	Info go
//---------------------------------------------------------------------
var int PrisonGuard_Rules;
//---------------------------------------------------------------------
INSTANCE DIA_Addon_10023_Wache_go   (C_INFO)
{
	npc         = BDT_10023_Addon_Wache;
	nr          = 99;
	condition   = DIA_Addon_10023_Wache_go_Condition;
	information = DIA_Addon_10023_Wache_go_Info;
	permanent   = TRUE;
	description = "Lass die Sklaven frei!";
};
FUNC INT DIA_Addon_10023_Wache_go_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_10023_Wache_go_Info()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_15_00");//Lass die Sklaven frei!
	
	if (PrisonGuard_Rules == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_01");//Pass mal auf. Bloodwyn hat hier das Kommando. Ihm gehören die Sklaven, also hat er das Recht, sie freizulassen.
		AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_02");//Außerdem hat Thorus da auch noch ein Wort mitzureden. Und was ist mit dir?
		PrisonGuard_Rules = TRUE;
		B_LogEntry (Topic_Addon_Sklaven,"Bloodwyn und Thorus haben das alleinige Recht die Sklaven freizulassen.");
	};
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_11_03");//Hast DU hier irgendwas zu sagen?
	
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
	Info_AddChoice (DIA_Addon_10023_Wache_go,DIALOG_BACK,DIA_Addon_10023_Wache_go_BACK);
	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Answer)
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"Ich habe mit Thorus gesprochen.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else if Npc_IsDead (Bloodwyn)
	&& (Npc_HasItems (other,ItMi_Addon_Bloodwyn_Kopf) >=1)
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"(Bloodwyn's Kopf zeigen)",DIA_Addon_10023_Wache_go_Blood);
	}
	else
	{
		Info_AddChoice (DIA_Addon_10023_Wache_go,"Ich entscheide WER in die Mine kommt.",DIA_Addon_10023_Wache_go_WER);
	};
};	
FUNC VOID DIA_Addon_10023_Wache_go_BACK()
{
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
};
FUNC VOID DIA_Addon_10023_Wache_go_WER()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_WER_15_00");//Ich entscheide, WER in die Mine kommt.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_WER_11_01");//Du machst Estebans alten Job? Dann hast du hier GAR NICHTS zu melden. Schwirr ab.
	Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
};
//----------------------------------------
var int Wache_einmal;
//----------------------------------------
FUNC VOID DIA_Addon_10023_Wache_go_Blood()
{
	
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_00");//Hier reicht das?
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_01");//(würgt) Steck das wieder weg. DAS will ich nicht sehen.
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_02");//Es wäre besser für dich, wenn du die Sklaven JETZT freilässt.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_03");//Warte mal. Bloodwyn ist nicht der Einzige, der hier was zu sagen hat. Solange ich keinen Befehl von Thorus habe, wird hier niemand freigelassen.
	
	if Npc_KnowsInfo (other, DIA_Addon_Thorus_Answer)
	{
		Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
		Info_AddChoice (DIA_Addon_10023_Wache_go,"Ich habe mit Thorus gesprochen.",DIA_Addon_10023_Wache_go_Thorus);
	}
	else
	{
		if (Wache_einmal == FALSE)
		{
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_04");//Du hast doch gesagt, dass die Sklaven Bloodwyn gehören.
			AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_05");//Ja. Ich habe aber auch gesagt, dass ich ohne Befehl von Thorus niemanden freilassen werde.
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_06");//Du gehörst zu den Typen, die ohne Befehl nicht mal pinkeln gehen, was?
			Wache_einmal = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_10023_Wache_go_Blood_11_07");//Ja, ich habe aber auch gesagt ...
			AI_Output (other, self, "DIA_Addon_10023_Wache_go_Blood_15_08");//... schon gut, erspar mir den Rest.
		};
		Info_ClearChoices 	(DIA_Addon_10023_Wache_go);
	}; 
	
	
};
FUNC VOID DIA_Addon_10023_Wache_go_Thorus()
{
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Thorus_15_00");//Ich habe mit Thorus gesprochen. Er befiehlt, die Sklaven freizulassen.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Thorus_11_01");//Okay, wenn Thorus das befiehlt. Ich frage mich zwar, warum er so was entscheidet ...
	AI_Output (other, self, "DIA_Addon_10023_Wache_go_Thorus_15_02");//... aber für deine Fragen wirst du nicht bezahlt.
	AI_Output (self, other, "DIA_Addon_10023_Wache_go_Thorus_11_03");//Ist ja schon gut - ich werd hier also nicht mehr gebraucht, dann hole ich mir mal 'ne Suppe.
	
	Ready_Togo = TRUE;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "SOUP");
};
