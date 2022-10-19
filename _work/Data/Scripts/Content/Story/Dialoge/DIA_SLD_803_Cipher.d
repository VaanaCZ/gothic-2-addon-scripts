// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Cipher_EXIT(C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 999;
	condition	= DIA_Cipher_EXIT_Condition;
	information	= DIA_Cipher_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Cipher_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Cipher_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  					Hello 
// ************************************************************

instance DIA_Cipher_Hello (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 1;
	condition	= DIA_Cipher_Hello_Condition;
	information	= DIA_Cipher_Hello_Info;
	permanent	= FALSE;
	description = "Wie sieht's aus?";
};                       

FUNC INT DIA_Cipher_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Cipher_Hello_Info()
{	
	AI_Output (other, self, "DIA_Cipher_Hello_15_00"); //Wie sieht's aus?
	AI_Output (self, other, "DIA_Cipher_Hello_07_01"); //Hey, kenne ich dich nicht irgendwoher?
	AI_Output (other, self, "DIA_Cipher_Hello_15_02"); //Kann schon sein ...
	AI_Output (self, other, "DIA_Cipher_Hello_07_03"); //Ich habe damals in der Kolonie mit Sumpfkraut gehandelt, wei�t du noch?
};

// ************************************************************
// 			  					TradeWhat 
// ************************************************************

instance DIA_Cipher_TradeWhat (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_TradeWhat_Condition;
	information	= DIA_Cipher_TradeWhat_Info;
	permanent	= FALSE;
	description = "Und womit handelst du jetzt?";
};                       

FUNC INT DIA_Cipher_TradeWhat_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_Hello))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_TradeWhat_Info()
{	
	AI_Output (other, self, "DIA_Cipher_TradeWhat_15_00"); //Und womit handelst du jetzt?
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_01"); //Ach, frag nicht.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_02"); //Ich hatte ein ganzes Paket Sumpfkraut aus der Minenkolonie mitgebracht.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_03"); //Viele von den S�ldnern rauchen gerne mal einen. Ich hab 'ne h�bsche Stange Geld nebenbei verdient.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_04"); //Aber irgendein Mistkerl hat mir das ganze Kraut aus meiner Truhe gestohlen!
	
	Log_CreateTopic (Topic_CipherPaket,LOG_MISSION);
	Log_SetTopicStatus (Topic_CipherPaket,LOG_RUNNING);
	B_LogEntry (Topic_CipherPaket, "Dem S�ldner Cipher ist ein Paket mit Sumpfkraut abhanden gekommen.");
	
	
	if (!Npc_IsDead (Bodo))
	{
		AI_Output (self, other, "DIA_Cipher_TradeWhat_07_05"); //Bin mir ziemlich sicher, dass es dieser Bodo war, er hat sein Bett im selben Raum wie ich und er grinst mich immer so d�mlich an ...
		B_LogEntry (Topic_CipherPaket, "Er vermutet, das Bodo es gestohlen hat.");
	};
	
	MIS_Cipher_Paket = LOG_RUNNING;
};

// ************************************************************
// 			  					DoWithThief 
// ************************************************************

instance DIA_Cipher_DoWithThief (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_DoWithThief_Condition;
	information	= DIA_Cipher_DoWithThief_Info;
	permanent	= FALSE;
	description = "Was willst du jetzt mit dem Dieb machen?";
};                       

FUNC INT DIA_Cipher_DoWithThief_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_TradeWhat))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_DoWithThief_Info()
{	
	AI_Output (other, self, "DIA_Cipher_DoWithThief_15_00"); //Was willst du jetzt mit dem Dieb machen?
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_01"); //Irgendwann werd ich ihn dabei erwischen, wie er mein Kraut wegraucht.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_02"); //Und dann werd ich mir ein ruhiges �rtchen suchen und ihn mir mal zur Brust nehmen.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_03"); //Wenn ich ihn hier mitten auf dem Platz umhaue, kriegen's die anderen Bauern mit und ich kann mich dumm und d�mlich bezahlen.
	AI_Output (other, self, "DIA_Cipher_DoWithThief_15_04"); //Warum das?
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_05"); //Ganz einfach. Wir d�rfen uns nicht an den Bauern vergreifen, sonst kn�pft uns Lee ein fettes Strafgeld ab. Onar will das so.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_06"); //Und je mehr Zeugen es gibt, desto mehr Wind wird gemacht. Das macht die Sache teurer.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_07"); //Also werd ich die Sache sch�n unauff�llig abziehen ...
};

// ************************************************************
// 			  					WannaJoin 
// ************************************************************

instance DIA_Cipher_WannaJoin (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_WannaJoin_Condition;
	information	= DIA_Cipher_WannaJoin_Info;
	permanent	= FALSE;
	description = "Ich will mich Lees Leuten anschlie�en!";
};                       

FUNC INT DIA_Cipher_WannaJoin_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_Hello))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Cipher_WannaJoin_15_00"); //Ich will mich Lees Leuten anschlie�en!
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_01"); //LEES Leute?! Wenn Lee so weitermacht, sind das bald nicht mehr seine Leute!
	AI_Output (other, self, "DIA_Cipher_WannaJoin_15_02"); //Wieso?
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_03"); //Lee war immer schon ein ruhiger Vertreter. Das war schon damals in der Kolonie so.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_04"); //Aber in letzter Zeit �bertreibt er es. Er will, dass wir hier sitzen und einfach abwarten, bis die Paladine ausgehungert sind.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_05"); //Sylvio ist der Meinung, wir sollten mal ein bisschen auf den kleinen H�fen und vor der Stadt aufr�umen.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_06"); //Ich glaube, das w�re mal 'ne gelungene Abwechslung.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_07"); //Zurzeit drehen die meisten von uns hier nur D�umchen - willst du dich uns trotzdem anschlie�en?
};

// ************************************************************
// 			  					YesJoin 
// ************************************************************

instance DIA_Cipher_YesJoin (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_YesJoin_Condition;
	information	= DIA_Cipher_YesJoin_Info;
	permanent	= FALSE;
	description = "Ich will auf jeden Fall bei euch mitmachen!";
};                       

FUNC INT DIA_Cipher_YesJoin_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_WannaJoin))
	&& (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_YesJoin_Info()
{	
	AI_Output (other, self, "DIA_Cipher_YesJoin_15_00"); //Ich will auf jeden Fall bei euch mitmachen!
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_01"); //Du wei�t bestimmt schon, dass �ber jeden Neuen abgestimmt wird?
	AI_Output (other, self, "DIA_Cipher_YesJoin_15_02"); //Worauf willst du hinaus?
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_03"); //Na ja, ich hatte lange nichts mehr zu rauchen. Bring mir ein paar St�ngel Sumpfkraut und meine Stimme geh�rt dir.
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_04"); //Du kannst bestimmt irgendwo was auftreiben.
	
	MIS_Cipher_BringWeed = LOG_RUNNING;
	
	Log_CreateTopic (Topic_CipherHerb,LOG_MISSION);
	Log_SetTopicStatus(Topic_CipherHerb,LOG_RUNNING);
	B_LogEntry (Topic_CipherHerb,"Cipher gibt mir seine Stimme, wenn ich ihm ein paar Stengel Sumpfkraut bringe.");
};

// ************************************************************
// 			  					Joints 
// ************************************************************

instance DIA_Cipher_Joints (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_Joints_Condition;
	information	= DIA_Cipher_Joints_Info;
	permanent	= TRUE;
	description = "Wegen des Sumpfkrauts ...";
};                       

FUNC INT DIA_Cipher_Joints_Condition()
{
	if (MIS_Cipher_BringWeed == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_Joints_Info()
{	
	AI_Output (other, self, "DIA_Cipher_Joints_15_00"); //Wegen des Sumpfkrauts ...
	
	if (MIS_Cipher_Paket == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Cipher_Joints_07_01"); //Du hast mir mein Paket zur�ckgebracht! Jetzt wird alles wieder gut.
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_07_02"); //Dass ich f�r dich stimme ist ja wohl klar ...
			
			B_LogEntry (TOPIC_SLDRespekt,"Cipher stimmt f�r mich, wenn ich mich den S�ldnern anschlie�e.");
		};
		
		MIS_Cipher_BringWeed = LOG_OBSOLETE; //Cipher ist gl�cklich
	}
	else //normal Running
	{
		Info_ClearChoices (DIA_Cipher_Joints);
		Info_AddChoice (DIA_Cipher_Joints, "Ich werd sehen, was ich machen kann...", DIA_Cipher_Joints_Running);
		if (Npc_HasItems (other, itmi_joint) > 0)
		{
			Info_AddChoice (DIA_Cipher_Joints, "Hier hast du ein paar Stengel...", DIA_Cipher_Joints_Success);
		};
	};
};

func void DIA_Cipher_Joints_Running()
{
	AI_Output (other, self, "DIA_Cipher_Joints_Running_15_00"); //Ich werd sehen, was ich machen kann ...
	Info_ClearChoices (DIA_Cipher_Joints);
};

func void DIA_Cipher_Joints_Success()
{
	AI_Output (other, self, "DIA_Cipher_Joints_Success_15_00"); //Hier hast du ein paar St�ngel ...
	
	if (B_GiveInvItems (other, self, itmi_joint, 10))
	{
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_01"); //Ah! Du bist mein Mann!
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_Success_07_02"); //Meine Stimme geh�rt dir.
		};
		MIS_Cipher_BringWeed = LOG_SUCCESS;
		B_LogEntry (TOPIC_SLDRespekt,"Cipher stimmt f�r mich, wenn ich mich den S�ldnern anschlie�e.");
		B_GivePlayerXP (XP_CipherWeed);
		
	}
	else
	{
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_03"); //So wenig? Das hab ich doch in einem Mal weggeraucht!
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_04"); //Also 10 St�ngel m�ssen's schon sein.
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_Success_07_05"); //Immerhin geb ich dir meine Stimme f�r die Aufnahme bei uns.
		};
	};

	Info_ClearChoices (DIA_Cipher_Joints);
};


// ************************************************************
// 			  					TRADE
// ************************************************************

instance DIA_Cipher_TRADE (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_TRADE_Condition;
	information	= DIA_Cipher_TRADE_Info;
	permanent	= TRUE;
	description = "Zeig' mir deine Ware. ";
	trade		= TRUE;
};                       

FUNC INT DIA_Cipher_TRADE_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Cipher_TradeWhat))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_TRADE_Info()
{	
	AI_Output (other, self, "DIA_Cipher_TRADE_15_00"); //Zeig' mir deine Ware.
	if (Npc_HasItems(self, itmi_joint) > 0)
	{
		AI_Output (self, other, "DIA_Cipher_TRADE_07_01"); //Klar. Bedien dich.
	}
	else
	{
		AI_Output (self, other, "DIA_Cipher_TRADE_07_02"); //Ich hab zurzeit kein Sumpfkraut. Willst du was anderes?
	};
};

// ************************************************************
// 			  					Dar Dieb
// ************************************************************

instance DIA_Cipher_DarDieb (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_DarDieb_Condition;
	information	= DIA_Cipher_DarDieb_Info;
	permanent	= FALSE;
	description = "Ich wei�, wer dein Kraut gestohlen hat.";
};                       

FUNC INT DIA_Cipher_DarDieb_Condition()
{
	if ( (Dar_Dieb == TRUE) || (Dar_Verdacht == TRUE) )
	&& (!Npc_IsDead (Dar))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_DarDieb_Info()
{	
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_00"); //Ich wei�, wer dein Kraut gestohlen hat.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_01"); //Wer? War es dieser Bodo?
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_02"); //Nein - es war einer von den S�ldnern - Dar.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_03"); //Dieser Dreckskerl - wo ist er?
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_04"); //Du kannst dir den Weg sparen, er hat das Paket nicht mehr. Er hat es in Khorinis verkauft.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_05"); //WO IST ER!?!
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_06"); //Hinterm K�chenhaus, an der Ecke ...
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_07"); //ICH MACH IHN PLATT!
	
	AI_StopProcessInfos(self);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_Attack (self, Dar, AR_NONE, 0);
};

// ************************************************************
// 			  					Dar LOST
// ************************************************************

instance DIA_Cipher_DarLOST (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_DarLOST_Condition;
	information	= DIA_Cipher_DarLOST_Info;
	permanent	= FALSE;
	description = "Du hast es Dar wohl ziemlich gezeigt ... F�hlst du dich jetzt besser?";
};                       

FUNC INT DIA_Cipher_DarLOST_Condition()
{
	if (Dar_LostAgainstCipher == TRUE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_DarLOST_Info()
{	
	AI_Output (other, self, "DIA_Cipher_DarLOST_15_00"); //Du hast es Dar wohl ziemlich gezeigt ... F�hlst du dich jetzt besser?
	AI_Output (self, other, "DIA_Cipher_DarLOST_07_01"); //(seufzt) Ja, das tat gut.
	AI_Output (other, self, "DIA_Cipher_DarLOST_15_02"); //Ich sch�tze, IHM nicht so ...
	AI_Output (self, other, "DIA_Cipher_DarLOST_07_03"); //Was geht der kleine Penner auch an meine Truhe!
	
	B_GivePlayerXP ((XP_Ambient)*2);
};

// ************************************************************
// 			  				Kraut PAKET
// ************************************************************

instance DIA_Cipher_KrautPaket (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 2;
	condition	= DIA_Cipher_KrautPaket_Condition;
	information	= DIA_Cipher_KrautPaket_Info;
	permanent	= FALSE;
	description = "Kann es sein, dass dieses Paket Sumpfkraut dir geh�rt?";
};                       

FUNC INT DIA_Cipher_KrautPaket_Condition()
{
	if (Npc_HasItems (other, ItMi_HerbPaket) > 0)
	&& (MIS_Cipher_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Cipher_KrautPaket_Info()
{	
	AI_Output (other, self, "DIA_Cipher_KrautPaket_15_00"); //Kann es sein, dass dieses Paket Sumpfkraut dir geh�rt?
	B_GiveInvItems (other, self, ItMi_HerbPaket, 1);
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_01"); //Ich werd verr�ckt! Wo hast du es her?
	AI_Output (other, self, "DIA_Cipher_KrautPaket_15_02"); //Ist 'ne lange Geschichte ...
	
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_03"); //Ist ja auch egal, du bist echt 'n anst�ndiger Kerl.
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_04"); //Hier, das sollst du als Belohnung haben. Viel Spa� damit!
	B_GiveInvItems (self, other, itmi_gold, 200);
	B_GiveInvItems (self, other, itmi_joint, 10);
	B_GivePlayerXP (XP_Cipher_KrautPaket);
	
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_05"); //Ich werd erstmal ein paar drehen ...
	CreateInvItems (self, itmi_joint, 40);
	Npc_RemoveInvItems (self, ItMi_HerbPaket, 1);
	
	MIS_Cipher_Paket = LOG_SUCCESS;
	B_GivePlayerXP (XP_CipherPaket);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_CipherSLD_PICKPOCKET (C_INFO)
{
	npc			= Sld_803_Cipher;
	nr			= 900;
	condition	= DIA_CipherSLD_PICKPOCKET_Condition;
	information	= DIA_CipherSLD_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_CipherSLD_PICKPOCKET_Condition()
{
	C_Beklauen (65, 65);
};
 
FUNC VOID DIA_CipherSLD_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_CipherSLD_PICKPOCKET);
	Info_AddChoice		(DIA_CipherSLD_PICKPOCKET, DIALOG_BACK 		,DIA_CipherSLD_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_CipherSLD_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_CipherSLD_PICKPOCKET_DoIt);
};

func void DIA_CipherSLD_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Cipher_PICKPOCKET);
};
	
func void DIA_CipherSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Cipher_PICKPOCKET);
};


		



		
	
//#####################################################################
//##
//##
//##						Bis - KAPITEL 3 - (danach in OW!)
//##
//##
//#####################################################################
	

	



	
/**/
