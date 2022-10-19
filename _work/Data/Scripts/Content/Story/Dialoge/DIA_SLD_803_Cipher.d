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
	description = "Jak to jde?";
};                       

FUNC INT DIA_Cipher_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Cipher_Hello_Info()
{	
	AI_Output (other, self, "DIA_Cipher_Hello_15_00"); //Jak se vede?
	AI_Output (self, other, "DIA_Cipher_Hello_07_01"); //Hej, neznám tê odnêkud?
	AI_Output (other, self, "DIA_Cipher_Hello_15_02"); //Je to možné...
	AI_Output (self, other, "DIA_Cipher_Hello_07_03"); //Pokoušel jsem se v kolonii obchodovat s trávou z bažin, vzpomínáš?
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
	description = "A s èímpak obchoduješ nyní?";
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
	AI_Output (other, self, "DIA_Cipher_TradeWhat_15_00"); //A s èímpak obchoduješ teë?
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_01"); //Ani se neptej.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_02"); //Pâinesl jsem si s sebou z hornické kolonie celý pytlík téhle trávy.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_03"); //Hodnê žoldákù dostane tu a tam chuã si trochu zakouâit. Vydêlal jsem si takhle bokem trochu penêz.
	AI_Output (self, other, "DIA_Cipher_TradeWhat_07_04"); //Ale nêjaký bastard mi ukradl z truhly všechnu trávu!
	
	Log_CreateTopic (Topic_CipherPaket,LOG_MISSION);
	Log_SetTopicStatus (Topic_CipherPaket,LOG_RUNNING);
	B_LogEntry (Topic_CipherPaket, "Žoldnéâi Cipherovi se ztratil balík trávy z bažin.");
	
	
	if (!Npc_IsDead (Bodo))
	{
		AI_Output (self, other, "DIA_Cipher_TradeWhat_07_05"); //Jsem si docela jistej, že to byl Bodo. Obývá stejnou místnost jako já a vždycky se na mê kâení jako nêjakej idiot.
		B_LogEntry (Topic_CipherPaket, "Domnívá se, že zlodêjem je Bodo.");
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
	description = "Co tedy hodláš s tím zlodêjem udêlat?";
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
	AI_Output (other, self, "DIA_Cipher_DoWithThief_15_00"); //Co tedy chceš s tím zlodêjem udêlat?
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_01"); //Jednou ho urèitê nachytám, jak bude kouâit mojí trávu.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_02"); //A pak si najdu nêjaké odlehlé místo a dám mu takovou lekci, na kterou do smrti nezapomene.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_03"); //Kdybych ho napadnul tady uprostâed dvora, ostatní by si toho všimli a já bych si to odskákal.
	AI_Output (other, self, "DIA_Cipher_DoWithThief_15_04"); //Jak to?
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_05"); //To je jednoduché. Nemùžeme zmlátit farmáâe, jinak bychom Leeovi zaplatili pokutu. Takhle to chce Onar.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_06"); //A èím více svêdkù u toho je, tím více poprasku kolem toho bude. A to by se nám prodražilo.
	AI_Output (self, other, "DIA_Cipher_DoWithThief_07_07"); //Takže tu vêc vyâídím hezky nenápadnê.
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
	description = "Chci se pâidat k Leeovým lidem!";
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
	AI_Output (other, self, "DIA_Cipher_WannaJoin_15_00"); //Chci se pâidat k Leeovým lidem!
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_01"); //Leeovým lidem?! Jestli Lee bude pokraèovat tímhle zpùsobem, tak už brzy jeho nebudou!
	AI_Output (other, self, "DIA_Cipher_WannaJoin_15_02"); //Proè?
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_03"); //Lee byl vždycky kliëas. To byl v kolonii taky.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_04"); //Ale poslední dobou to už pâehání. Chce si sem prostê jen tak sednout a èekat, dokud paladinové neumâou hlady.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_05"); //Sylvio si myslí, že bychom mêli trochu vyèistit malé farmy a okolí mêsta.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_06"); //Myslím, že by se mêl co nejdâíve úplnê zmênit.
	AI_Output (self, other, "DIA_Cipher_WannaJoin_07_07"); //V týhle chvíli tu vêtšina z nás sedí s rukama v klínê - i tak se chceš k nám poâád pâidat?
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
	description = "Chci se stát jedním z vás a je mi jedno jak!";
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
	AI_Output (other, self, "DIA_Cipher_YesJoin_15_00"); //Chci se stát jedním z vás a je mi jedno jak!
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_01"); //Už víš, že musíme nechat o každém novém rekrutovi hlasovat?
	AI_Output (other, self, "DIA_Cipher_YesJoin_15_02"); //Na co narážíš?
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_03"); //No, už jsem hodnê dlouho nic nekouâil. Pâines mi trochu trávy z bažin a dostaneš mùj hlas.
	AI_Output (self, other, "DIA_Cipher_YesJoin_07_04"); //Jistê se ti podaâí nêjakou splašit.
	
	MIS_Cipher_BringWeed = LOG_RUNNING;
	
	Log_CreateTopic (Topic_CipherHerb,LOG_MISSION);
	Log_SetTopicStatus(Topic_CipherHerb,LOG_RUNNING);
	B_LogEntry (Topic_CipherHerb,"Cipher se za mê zaruèí, pokud mu pâinesu nêjakou trávu z bažin.");
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
	description = "Co se týèe trávy z bažin...";
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
	AI_Output (other, self, "DIA_Cipher_Joints_15_00"); //Co se týèe trávy z bažin...
	
	if (MIS_Cipher_Paket == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Cipher_Joints_07_01"); //Pâinesl jsi mi zpátky mùj balíèek trávy! Teë bude všechno v poâádku.
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_07_02"); //Samozâejmê budu hlasovat pro tebe.
			
			B_LogEntry (TOPIC_SLDRespekt,"Když se budu chtít pâidat k žoldnéâùm, Cipher se za mê pâimluví.");
		};
		
		MIS_Cipher_BringWeed = LOG_OBSOLETE; //Cipher ist glücklich
	}
	else //normal Running
	{
		Info_ClearChoices (DIA_Cipher_Joints);
		Info_AddChoice (DIA_Cipher_Joints, "Uvidím, co se dá dêlat...", DIA_Cipher_Joints_Running);
		if (Npc_HasItems (other, itmi_joint) > 0)
		{
			Info_AddChoice (DIA_Cipher_Joints, "Tady máš pár stébel...", DIA_Cipher_Joints_Success);
		};
	};
};

func void DIA_Cipher_Joints_Running()
{
	AI_Output (other, self, "DIA_Cipher_Joints_Running_15_00"); //Uvidím, co se dá dêlat...
	Info_ClearChoices (DIA_Cipher_Joints);
};

func void DIA_Cipher_Joints_Success()
{
	AI_Output (other, self, "DIA_Cipher_Joints_Success_15_00"); //Tady máš pár stébel.
	
	if (B_GiveInvItems (other, self, itmi_joint, 10))
	{
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_01"); //Ach! Ty jsi mùj èlovêk!
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_Success_07_02"); //Máš mùj hlas.
		};
		MIS_Cipher_BringWeed = LOG_SUCCESS;
		B_LogEntry (TOPIC_SLDRespekt,"Když se budu chtít pâidat k žoldnéâùm, Cipher se za mê pâimluví.");
		B_GivePlayerXP (XP_CipherWeed);
		
	}
	else
	{
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_03"); //To je všechno? Tohle vykouâím na jeden zátah!
		AI_Output (self, other, "DIA_Cipher_Joints_Success_07_04"); //To je nejménê na deset špekù.
		if (other.guild == GIL_NONE)
		{
			AI_Output (self, other, "DIA_Cipher_Joints_Success_07_05"); //V každém pâípadê máš mùj hlas, aby ses k nám pâidal.
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
	description = "Ukaž mi své zboží.";
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
	AI_Output (other, self, "DIA_Cipher_TRADE_15_00"); //Ukaž mi své zboží.
	if (Npc_HasItems(self, itmi_joint) > 0)
	{
		AI_Output (self, other, "DIA_Cipher_TRADE_07_01"); //Jistê. Jak je libo.
	}
	else
	{
		AI_Output (self, other, "DIA_Cipher_TRADE_07_02"); //V téhle chvíli nemám žádnou trávu. Nechceš nêco jiného?
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
	description = "Vím, kdo ti sebral tvojí trávu.";
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
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_00"); //Vím, kdo ti sebral tu trávu.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_01"); //Kdo? Byl to Bodo?
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_02"); //Ne - udêlal to jeden z žoldákù. Jmenuje se Dar.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_03"); //Ten parchant - kde je?
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_04"); //Tím, že ho najdeš, si nepomùžeš. Už nemá ten balíèek u sebe. Prodal ho v Khorinidu.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_05"); //KDE JE!?!
	AI_Output (other, self, "DIA_Cipher_DarDieb_15_06"); //Za tou budovou s kuchyní, na rohu.
	AI_Output (self, other, "DIA_Cipher_DarDieb_07_07"); //JÁ SI TO S NÍM VYÂÍDÍM!
	
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
	description = "Vážnê jsi dal Darovi co proto... cítíš se teë líp?";
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
	AI_Output (other, self, "DIA_Cipher_DarLOST_15_00"); //Skuteènê jsi dal Darovi co proto. Cítíš se teë líp?
	AI_Output (self, other, "DIA_Cipher_DarLOST_07_01"); //(povzdech) Joo, cítím se fajn.
	AI_Output (other, self, "DIA_Cipher_DarLOST_15_02"); //Pâedpokládám, že ON ne...
	AI_Output (self, other, "DIA_Cipher_DarLOST_07_03"); //Ten malej žebrák se nemá co štrachat v mojí truhle!
	
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
	description = "Není tenhle balíèek trávy náhodou tvùj?";
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
	AI_Output (other, self, "DIA_Cipher_KrautPaket_15_00"); //Není tenhle balíèek trávy náhodou tvùj?
	B_GiveInvItems (other, self, ItMi_HerbPaket, 1);
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_01"); //No, jasnê! Kde jsi ho sebral?
	AI_Output (other, self, "DIA_Cipher_KrautPaket_15_02"); //To je dlouhý pâíbêh...
	
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_03"); //To nevadí, opravdu jsi slušnej chlapík.
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_04"); //Tady, vezmi si tohle jako odmênu. Užij si to!
	B_GiveInvItems (self, other, itmi_gold, 200);
	B_GiveInvItems (self, other, itmi_joint, 10);
	B_GivePlayerXP (XP_Cipher_KrautPaket);
	
	AI_Output (self, other, "DIA_Cipher_KrautPaket_07_05"); //Teë mê nech trochu pracovat...
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
