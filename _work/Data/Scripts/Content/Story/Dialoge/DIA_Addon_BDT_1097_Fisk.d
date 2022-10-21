//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_EXIT   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 999;
	condition   = DIA_Addon_Fisk_EXIT_Condition;
	information = DIA_Addon_Fisk_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Fisk_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Fisk_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Fisk_PICKPOCKET (C_INFO)
{
	npc			= BDT_1097_Addon_Fisk;
	nr			= 900;
	condition	= DIA_Addon_Fisk_PICKPOCKET_Condition;
	information	= DIA_Addon_Fisk_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       
FUNC INT DIA_Addon_Fisk_PICKPOCKET_Condition()
{
	C_Beklauen (118, 300);
};
 
FUNC VOID DIA_Addon_Fisk_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Fisk_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Fisk_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Fisk_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Fisk_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Fisk_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fisk_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Fisk_PICKPOCKET);
};
	
func void DIA_Addon_Fisk_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Fisk_PICKPOCKET);
};
//--------------------------------------------------------------------
//	Info Hi
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Hi   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 1;
	condition   = DIA_Addon_Fisk_Hi_Condition;
	information = DIA_Addon_Fisk_Hi_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Fisk_Hi_Condition()
{	
	if (Npc_GetDistToWP (self, "BL_INN_UP_06") > 500)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Fisk_Hi_12_00");//Hey, wenn du hier im Lager einen anständigen Händler suchst, dann hast du ihn gerade gefunden.
	AI_Output (self, other, "DIA_Addon_Fisk_Hi_12_01");//Meine Hütte steht direkt hinter Esteban. Also, wenn du was brauchst, komm vorbei.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Fisk handelt mit Waren aller Art.");
	
	AI_StopProcessInfos  (self);
	Npc_ExchangeRoutine  (self,"START");
};
//--------------------------------------------------------------------
//	Info Trade
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Trade   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 888;
	condition   = DIA_Addon_Fisk_Trade_Condition;
	information = DIA_Addon_Fisk_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;

};
FUNC INT DIA_Addon_Fisk_Trade_Condition()
{	
	if (Npc_GetDistToWP (self, "BL_INN_UP_06") > 500)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Trade_Info()
{
	B_Say (other,self,"$TRADE_2");
	B_GiveTradeInv(self);
	
	//Bolzen nachfüllen
	if (Npc_HasItems (self, ItRw_Bolt) < 50)
	{
		CreateInvItems (self,ItRw_Bolt, (50 - Npc_HasItems (self, ItRw_Bolt))); 
	};
	//Pfeile nachfüllen
	if (Npc_HasItems (self, ItRw_Arrow) < 50)
	{
		CreateInvItems (self,ItRw_Arrow, (50 - Npc_HasItems (self, ItRw_Arrow))); 
	};
};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
instance DIA_Addon_Fisk_Attentat   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 2;
	condition   = DIA_Addon_Fisk_Attentat_Condition;
	information = DIA_Addon_Fisk_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Fisk_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_00"); //Hör zu, ich will mit der Sache nichts zu tun haben, klar!
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_01"); //(unschuldig) Ich habe meine eigenen Sorgen, ich bin selbst ein Opfer.
	AI_Output (other, self, "DIA_Addon_Fisk_Attentat_15_02"); //Inwiefern?
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_03"); //Hab' ne Menge Gold bezahlt für meine letzte Lieferung.
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_04"); //Aber die kam nie an! Irgendein Schwein hat sie sich unter den Nagel gerissen.
	AI_Output (self, other, "DIA_Addon_Fisk_Attentat_12_05"); //(empört) Ich bin bestohlen worden - wahrscheinlich von einem unserer eigenen Leute!
};

//---------------------------------------------------------------------
//	Lieferung
//---------------------------------------------------------------------
instance DIA_Addon_Fisk_Lieferung   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 3;
	condition   = DIA_Addon_Fisk_Lieferung_Condition;
	information = DIA_Addon_Fisk_Lieferung_Info;
	permanent   = FALSE;
	description	= "Was war das für 'ne Lieferung?";
};
FUNC INT DIA_Addon_Fisk_Lieferung_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Fisk_Attentat))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Lieferung_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Lieferung_15_00"); //Was war das für 'ne Lieferung?
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_01"); //Ein Paket Dietriche. Jemand sollte sie für mich von den Piraten abholen.
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_02"); //Aber ein Kerl namens Juan hat es mir weggeschnappt. (sauer) Mitsamt dem Gold, das ich dafür bezahlt habe!
	AI_Output (self, other, "DIA_Addon_Fisk_Lieferung_12_03"); //Der Mistkerl versteckt sich irgendwo im Sumpf ...
	
	MIS_Lennar_Lockpick = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Addon_Fisk,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Fisk,LOG_RUNNING);
	B_LogEntry	(TOPIC_Addon_KillJuan,"Ein Typ namens Juan war an  dem Handel mit den Banditen beteiligt. Er soll sich irgendwo im Sumpf verstecken.");
	B_LogEntry (Topic_Addon_Fisk,"Ein Kerl Namens Juan hat Fisk die Lieferung (ein Paket Dietriche) weggeschnappt. Er vertseckt sich irgendwo im Sumpf. ");
};
	
//---------------------------------------------------------------------
//	Paket abgeben 
//---------------------------------------------------------------------
	func void B_Addon_Fisk_AboutJuan()
	{	
		if (Npc_IsDead(Juan))
		{
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_00"); //Er ist tot.
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_01"); //Gut, dann kann er mir keinen Ärger mehr machen!
		}
		else
		{
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_02"); //Er lebt noch ...
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_03"); //Du hast das Schwein leben lassen?
			AI_Output (other, self, "DIA_Addon_Fisk_AboutJuan_15_04"); //Er war nicht allein ...
			AI_Output (self, other, "DIA_Addon_Fisk_AboutJuan_12_05"); //Egal - ich werde auch so mit den Drecksäcken fertig ...
		};
	};
//---------------------------------------------------------------------
	func void B_Addon_Fisk_Belohnung()
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_00"); //Was dich betrifft ...
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_01"); //Ich habe ziemlich gute Beziehungen zu Huno.
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_02"); //Ich werde dafür sorgen, dass du ab jetzt billig an deine Rüstungen rankommst.
		Huno_ArmorCheap = TRUE;
		
		if (other.guild  == GIL_KDF)
		{
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_03"); //Und hier, diesen Stein habe ich einst von Corristo bekommen.
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_04"); //Es ist das einzige, was meine Flucht aus der Barriere überlebt hat. Ich denke, du kannst mehr damit anfangen als ich.
			B_GiveInvItems (self, other, ItMi_RuneBlank,1);
		}
		else 
		{
			AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_05"); //Außerdem geb ich dir eine von meinen Waffen.
		
			if (other.HitChance[NPC_TALENT_2H] > other.HitChance[NPC_TALENT_1H])   
			{
				B_GiveInvItems (self, other, ItMw_Streitaxt1,1);
			}
			else //1h größer oder beide gleich
			{
				B_GiveInvItems (self, other, ItMw_Bartaxt,1);
			};
		};
		
		AI_Output (self, other, "DIA_Addon_Fisk_Belohnung_12_06"); //(verschmitzt) Eine Hand wäscht die andere - das hat sich seit damals nicht geändert.
	};
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_GivePaket (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 4;
	condition   = DIA_Addon_Fisk_GivePaket_Condition;
	information = DIA_Addon_Fisk_GivePaket_Info;
	permanent   = FALSE;
	description = "Ich habe dein Paket.";
};
FUNC INT DIA_Addon_Fisk_GivePaket_Condition()
{	
	if (MIS_Lennar_Lockpick == LOG_RUNNING)
	&& (Npc_HasItems (other, ItMi_Addon_Lennar_Paket) >= 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_GivePaket_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_GivePaket_15_00"); //Ich habe dein Paket.
	B_GiveInvItems (other, self, ItMi_Addon_Lennar_Paket, 1);
	
	MIS_Lennar_Lockpick = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_LennarPaket);
	
	AI_Output (self, other, "DIA_Addon_Fisk_GivePaket_12_01"); //(erfreut) Tatsache! (argwöhnisch) Was ist mit Juan?
	
	B_Addon_Fisk_AboutJuan();
	
	B_Addon_Fisk_Belohnung();
};

//---------------------------------------------------------------------
//	Paket OPEN - 
//---------------------------------------------------------------------
instance DIA_Addon_Fisk_PaketOpen (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 5;
	condition   = DIA_Addon_Fisk_PaketOpen_Condition;
	information = DIA_Addon_Fisk_PaketOpen_Info;
	permanent   = FALSE;
	description = "Ich habe dein Paket geöffnet!";
};
FUNC INT DIA_Addon_Fisk_PaketOpen_Condition()
{	
	if (MIS_Lennar_Lockpick == LOG_RUNNING)
	&& (LennarPaket_Open == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_PaketOpen_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_PaketOpen_15_00"); //Ich habe dein Paket geöffnet!
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_01"); //(lacht) War ja klar! Konntest es nicht abwarten, was?
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_02"); //Hast du wenigstens die Dietriche noch?
	AI_Output (self, other, "DIA_Addon_Fisk_PaketOpen_12_03"); //Und was viel wichtiger ist: Was ist mit Juan?

	B_Addon_Fisk_AboutJuan();
};

//---------------------------------------------------------------------
//	- Dietriche abgeben! 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_GivePicks (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 6;
	condition   = DIA_Addon_Fisk_GivePicks_Condition;
	information = DIA_Addon_Fisk_GivePicks_Info;
	permanent   = TRUE;
	description = "Hier hat du ein Dutzend Dietriche...";
};
FUNC INT DIA_Addon_Fisk_GivePicks_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Fisk_PaketOpen))
	&& (MIS_Lennar_Lockpick == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_GivePicks_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_GivePicks_15_00"); //Hier hat du ein Dutzend Dietriche ...

	if (B_GiveInvItems (other, self, itke_lockpick, 12))
	{
		AI_Output (self, other, "DIA_Addon_Fisk_GivePicks_12_01"); //Sehr gut. Einige Leute warten schon auf neue Ware.
		B_Addon_Fisk_Belohnung();
		
		MIS_Lennar_Lockpick = LOG_SUCCESS;
		B_GivePlayerXP (XP_Addon_LennarPaket);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Fisk_GivePicks_12_02"); //Das ist kein Dutzend! (schlau) Du willst mir doch wohl nicht die Reste andrehen, hm?
	};
};


//---------------------------------------------------------------------
//	Inspektor
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Inspektor (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 7;
	condition   = DIA_Addon_Fisk_Inspektor_Condition;
	information = DIA_Addon_Fisk_Inspektor_Info;
	permanent   = FALSE;
	description = "Juan hat für Esteban gearbeitet!";
};
FUNC INT DIA_Addon_Fisk_Inspektor_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Fisk_Lieferung))
	&& (Npc_KnowsInfo (other, DIA_Addon_Tom_Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Inspektor_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_15_00"); //Juan hat für Esteban gearbeitet!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_01"); //(verblüfft) Was?
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_15_02"); //Spiel keine Spielchen mit mir! Du wusstest davon!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_03"); //(gefaßt) Gut. Du hast Recht. Aber dir ist auch hoffentlich klar, warum ich's dir nicht erzählt hab.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_04"); //Jeder hier im Lager weiß, dass du für Esteban arbeitest.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_12_05"); //Ich habe keine Lust, in die Sache mit reingezogen zu werden, nur weil du scharf auf 'nen roten Stein bist!
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Ich arbeite nicht wirklich für Esteban... ",DIA_Addon_Fisk_Inspektor_AntiEsteban);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Ich glaube dir nicht!",DIA_Addon_Fisk_Inspektor_DontBelieve);
	Info_AddChoice (DIA_Addon_Fisk_Inspektor,"Verstehe!",DIA_Addon_Fisk_Inspektor_ISee);
};

func void DIA_Addon_Fisk_Inspektor_ISee()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_ISee_15_00"); //Verstehe!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_ISee_12_01"); //Gut! Dann hör auch auf damit. Sonst hört uns noch einer!
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_DontBelieve()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_DontBelieve_15_00"); //Ich glaube dir nicht!
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_DontBelieve_12_01"); //Glaub, was du willst! Aber ich warne dich: Wenn du vorhast, Esteban irgendwelche Märchen über mich zu erzählen, bist du dran!
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

func void DIA_Addon_Fisk_Inspektor_AntiEsteban()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Inspektor_AntiEsteban_15_00"); //Ich arbeite nicht wirklich für Esteban ...
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_01"); //So? Du willst den alten Sack übers Ohr hauen?
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_02"); //Dann geb ich dir 'nen guten Rat: Behalt es für dich.
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_03"); //Wenn es um Esteban geht, solltest du NIEMANDEM trauen - nicht mal mir, klar?
	AI_Output (self, other, "DIA_Addon_Fisk_Inspektor_AntiEsteban_12_04"); //Und jetzt genug davon - sonst hört uns noch einer!
	
	Info_ClearChoices (DIA_Addon_Fisk_Inspektor);
};

//--------------------------------------------------------------------
//	Info Meeting
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Meeting   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 2;
	condition   = DIA_Addon_Fisk_Meeting_Condition;
	information = DIA_Addon_Fisk_Meeting_Info;
	permanent   = FALSE;
	description = "DU steckst also hinter dem Attentat.";
};
FUNC INT DIA_Addon_Fisk_Meeting_Condition()
{	
	if (Npc_GetDistToWP  (self, "BL_INN_UP_06") <= 500)
	&& (Npc_IsInState (self, ZS_Talk))
	&& (MIS_Judas == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Meeting_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_15_00");//DU steckst also hinter dem Attentat.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_01");//Ja. Esteban steht meinen Geschäften im Weg.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_02");//Alle Banditen, die für mich arbeiten, lässt er nicht mehr in die Mine. Er sorgt dafür, dass ALLE für ihn arbeiten - und nur für ihn.
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_12_03");//So kann er von jedem Geschäft seinen Teil abkassieren und kontrolliert das gesamte Lager.
	
	Info_ClearChoices (DIA_Addon_Fisk_Meeting);
	
	Info_AddChoice (DIA_Addon_Fisk_Meeting,"Was hast du jetzt vor?",DIA_Addon_Fisk_Meeting_now);
	Info_AddChoice (DIA_Addon_Fisk_Meeting,"Willst du an seine Stelle treten?",DIA_Addon_Fisk_Meeting_You);
	if (!Npc_IsDead(Esteban))
	{
		Info_AddChoice (DIA_Addon_Fisk_Meeting,"Ich könnte dich an Esteban verkaufen ...",DIA_Addon_Fisk_Meeting_sell);
	};
};
FUNC VOID DIA_Addon_Fisk_Meeting_You()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_You_15_00");//Willst du an seine Stelle treten?
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_You_12_01");//Nein, ich bin Händler - ich will nur in Ruhe meinen Geschäften nachgehen.
};
FUNC VOID DIA_Addon_Fisk_Meeting_sell()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_sell_15_00");//Ich könnte dich an Esteban verkaufen ...
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_sell_12_01");//Und dann? Was glaubst du wird dann passieren? Glaubst du, er gibt dir das, was du willst?
	AI_Output (self, other, "DIA_Addon_Fisk_Meeting_sell_12_02");//Vergiss es - ich habe einen besseren Plan.
};
FUNC VOID DIA_Addon_Fisk_Meeting_now()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_00");//Was hast du jetzt vor?
	
	if (!Npc_IsDead (Esteban))
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_01");//Wir werden Esteban aus dem Weg räumen. Das heißt, DU wirst ihn umlegen und seine Position übernehmen.
		AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_02");//Solange seine Leibwächter bei ihm sind, hab ich keine Chance.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_03");//Dann müssen wir sie dazu kriegen, dass sie abhauen. Und zwar mit der Wahrheit.
		AI_Output (other, self, "DIA_Addon_Fisk_Meeting_now_15_04");//Welche Wahrheit?
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_05");//Du hast deinen Job erledigt. Du weißt, dass ich hinter dem Attentat stecke.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_06");//Erzähle das Esteban und er wird seine Jungs schicken, um mich zu töten. Ich werde sie hier erwarten.
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_07");//Wenn sie weg sind, kannst du dir den Mistkerl vornehmen und ich kümmere mich um die Wachen.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_08"); //Esteban ist tot. Ich werde mich wieder dem Handel widmen ...
		AI_Output (self, other, "DIA_Addon_Fisk_Meeting_now_12_09"); //Hier, das ist für dich ...
		B_GiveInvItems (self, other, itmi_gold, 500);
	};
	
	Info_ClearChoices (DIA_Addon_Fisk_Meeting);
	MIS_Judas = LOG_SUCCESS;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"AMBUSH");
	B_LogEntry (Topic_Addon_Esteban, "Fisk hat das Attentat gegen Esteban beauftragt.");
};
//--------------------------------------------------------------------
//	Info Sieg
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Fisk_Sieg   (C_INFO)
{
	npc         = BDT_1097_Addon_Fisk;
	nr          = 2;
	condition   = DIA_Addon_Fisk_Sieg_Condition;
	information = DIA_Addon_Fisk_Sieg_Info;
	permanent   = FALSE;
	description = "Esteban ist erledigt.";
};
FUNC INT DIA_Addon_Fisk_Sieg_Condition()
{	
	if (MIS_Judas == LOG_SUCCESS)
	&&  Npc_IsDead (Esteban)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Fisk_Sieg_Info()
{
	AI_Output (other, self, "DIA_Addon_Fisk_Sieg_15_00");//Esteban ist erledigt.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_01");//Darauf habe ich lange gewartet.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_02");//Ich denke, du hast jetzt einiges zu tun und ich muss mich auch wieder um meine Geschäfte kümmern.
	AI_Output (self, other, "DIA_Addon_Fisk_Sieg_12_03");//Also, wenn du noch was brauchst, du weißt, wo du mich findest.
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "START");
	B_GivePlayerXP (XP_Ambient); 
};

