
// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_DiegoNW_EXIT(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 999;
	condition	= DIA_DiegoNW_EXIT_Condition;
	information	= DIA_DiegoNW_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_DiegoNW_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_DiegoNW_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//######################################
//##
//##	Permanent Info
//##
//######################################


// ************************************************************
// 	  	  Wie laufen die Geschäfte? (perm)
// ************************************************************

INSTANCE DIA_DiegoNW_Perm(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 998;
	condition	= DIA_DiegoNW_Perm_Condition;
	information	= DIA_DiegoNW_Perm_Info;
	permanent	= TRUE;

	description = "Jak jdou obchody?";
};                       
FUNC INT DIA_DiegoNW_Perm_Condition()
{
	if (Diego_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoNW_Perm_Info()
{	
	AI_Output (other,self ,"DIA_DiegoNW_Perm_15_00"); //Jak jdou obchody?
	AI_Output (self ,other,"DIA_DiegoNW_Perm_11_01"); //Mizernę. Nękdo mi męl âíct, že to s Khorinidem šlo k šípku.
	AI_Output (other,self ,"DIA_DiegoNW_Perm_15_02"); //No nevím. Já to męsto znám jenom takhle.
	AI_Output (self ,other,"DIA_DiegoNW_Perm_11_03"); //Męl jsi ho vidęt pâed pár lety. To by se ti vážnę líbilo.
};


//######################################
//##
//##	Kapitel 3
//##
//######################################

// ************************************************************
// 	  	  Ich brauche deine Hilfe.
// ************************************************************

INSTANCE DIA_DiegoNW_NeedHelp(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 1;
	condition	= DIA_DiegoNW_NeedHelp_Condition;
	information	= DIA_DiegoNW_NeedHelp_Info;

	important 	= TRUE;
};                       
FUNC INT DIA_DiegoNW_NeedHelp_Condition()
{
	if (Diego_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoNW_NeedHelp_Info()
{	
	if (Diego_IsDead == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_DiegoNW_NeedHelp_11_01"); //No teda, ty koukáš jak vyoraná myš!
		AI_Output (self ,other,"DIA_Addon_DiegoNW_NeedHelp_11_02"); //(smęje se) Myslels, že jsem to koupil, co?
		AI_Output (self ,other,"DIA_Addon_DiegoNW_NeedHelp_11_03"); //Chvíli jsem byl v bezvędomí, ale jak vidíš, poâád žiju.
		AI_Output (self ,other,"DIA_Addon_DiegoNW_NeedHelp_11_04"); //Nejdůležitęjší je, že teë jsme oba tady.
		AI_Output (self ,other,"DIA_Addon_DiegoNW_NeedHelp_11_05"); //Musíš mi pomoct.
	}
	else
	{
		AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_11_00"); //Fajn že jsi tady. Budeš mi muset pomoct.
	};
	Info_ClearChoices (DIA_DiegoNW_NeedHelp);
	
	if (DiegoOW.aivar[AIV_TalkedToPlayer] == FALSE)
	{
	//	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Wer bist du?",DIA_DiegoNW_NeedHelp_WhoAreYou);//Joly:macht keinen Sinn. Ohne mit Diego gesprochen zu haben -> Kein DiegoNW !! Hauptstory Kapitel 2 OW!!!!
	};
	
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Co je tohle za šaty?",DIA_DiegoNW_NeedHelp_Clothes);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Co tady dęláš?",DIA_DiegoNW_NeedHelp_Plan);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"O co jde?",DIA_DiegoNW_NeedHelp_Problem);
};

FUNC VOID DIA_DiegoNW_NeedHelp_Plan()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Plan_15_00"); //Co tady dęláš?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Plan_11_01"); //Pozoroval jsem stráže. Jsou poâád na nohou.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Plan_11_02"); //Âekl bych, že proklouznout mezi nimi nebude nijak snadný.
};

FUNC VOID DIA_DiegoNW_NeedHelp_WhoAreYou()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_00"); //Kdo jsi?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_01"); //Asi to bude mým oblečením. Stráže mę nechtęjí pustit do męsta.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_02"); //Proto jsem pâed męstem koupil od jednoho obchodníka tyhle hadry. Doufám, že si na mę vzpomínáš. Jsem Diego.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_03"); //Tenkrát v base jsem tę naučil všechno, co jsi potâeboval vędęt, abys pâežil.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_04"); //Pâece jsi to všechno nemohl zapomenout.
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_05"); //Ehm... co všechno se vlastnę stalo?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_06"); //No to mę podrž, ty si vážnę nic nepamatuješ.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_07"); //Hele, vážnę teë nemám čas ti všechno vysvętlovat. Âeknu to takhle: bývali jsme zatracenę dobâí pâátelé a nękolikrát jsem ti zachránil život.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_08"); //A teë potâebuji tvou pomoc.
};

FUNC VOID DIA_DiegoNW_NeedHelp_Clothes()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Clothes_15_00"); //Co je tohle za šaty?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Clothes_11_01"); //Koupil jsem je pâed męstem od jednoho obchodníka. Stráže mę poprvé nechtęly pustit dovnitâ.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Clothes_11_02"); //Taky není nutný, aby celý svęt vędęl, odkud jsem.
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Clothes_15_03"); //To je fakt.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Clothes_11_04"); //Taky to tak vidím. Ale i když jsem zahodil svůj hábit stína, jsem poâád tím, kým jsem byl vždycky.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Clothes_11_05"); //A s tímhle męstem mám velký plány.
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem ()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_15_00"); //Co jako?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_11_01"); //Hodnę vęcí se zmęnilo, co jsem odešel. Musím se znovu postavit na nohy.
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_15_02"); //V čem je problém?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_11_03"); //Musím se dostat do horní části męsta.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_11_04"); //Nejsem ale občanem męsta a nemám dost penęz, abych podplatil stráže. Ale naštęstí tady jsi ty!
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_15_05"); //Takže po mnę chceš, abych ti půjčil nęjaké peníze?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_11_06"); //Nesmysl. Nęjaké zlato mám - dokonce spoustu zlata! Bohužel ho nemám s sebou.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_11_07"); //Takže mi to moje zlato pâineseš.
	
	Info_ClearChoices (DIA_DiegoNW_NeedHelp);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Na to nemám čas.",DIA_DiegoNW_NeedHelp_Problem_NoTime);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Co z toho budu mít?",DIA_DiegoNW_NeedHelp_Problem_Reward);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Dobrá, pomůžu ti.",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou);
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_NoTime()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_00"); //Na to nemám čas.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_01"); //Hele, já myslel, že jsme kámoši! Byl jsem to koneckonců já, kdo ti zachránil kejhák, když tę hodili do kolonie.
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_02"); //Pâeháníš.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_03"); //Vážnę? Tak se zkus na chvilku zamyslet, jak by to s tebou dopadlo, kdybych ti tehdy nevysvętlil, jak se chovat.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_04"); //Rudní baroni by si tę dali k snídani, čekala by tę mizerná smrt v dolech.

	MIS_HelpDiegoNW = LOG_FAILED;
	
	Info_ClearChoices (DIA_DiegoNW_NeedHelp);
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_Reward()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_Reward_15_00"); //Co z toho budu mít?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_Reward_11_01"); //Ptal jsem se snad nękdy já tebe, co dostanu na oplátku? Jsme pâátelé, copak to je málo?
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_WillHelpYou()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_15_00"); //Dobrá, pomůžu ti.
	AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_11_01"); //No tak poslouchej. Když ještę stávala bariéra, schoval jsem si malý poklad na horší časy.
	AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_11_02"); //Akorát už je to dost dlouho, takže jsem si ho zapomnęl vzít.
	AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_11_03"); //A teë se odsud nemůžu hnout.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_11_03"); //Abych to zkrátil, prostę bęž do Hornického údolí a pâines mi moje zlato.

	MIS_HelpDiegoNW = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HelpDiegoNW,LOG_RUNNING);
	B_LogEntry (TOPIC_HelpDiegoNW,"Diegovo zlato je ukryto v Hornickém údolí. Potâebuje se dostat mezi smetánku, a tak mę pro nę poslal.");
	
	Info_ClearChoices (DIA_DiegoNW_NeedHelp);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Co chceš s tím zlatem dęlat?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Kde jsi to zlato získal?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold);
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Kam jsi to zlato ukryl?",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold);
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_15_00"); //Co chceš s tím zlatem dęlat?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_01"); //V horní části męsta je obchodník, co mu musím zaplatit dluh. Potâebuju to dát konečnę do poâádku.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_02"); //A pak budu moct začít úplnę novej život!
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_15_00"); //Kde jsi to zlato získal?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_01"); //Jsem snad jedinej, kdo si v Hornickém údolí šetâil pro strýčka Pâíhodu?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_02"); //Štípnout pár nugetů byla hračka. Dęlal jsem to prostę pro pâípad, že bysme se nakonec dostali ven.
	AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_HowGold_11_03"); //Všichni se jako diví hnali po rudę, takže o zlato se nikdo nestaral. 
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_00"); //Kam jsi to zlato ukryl?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_01"); //Je pâímo na tržnici. Nad opuštęným dolem. Jsou v kožené kabele.
	if (Diego_angekommen == TRUE)
	{
		AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_01"); //Takové poznámky si nechej pro sebe. To vím taky, že jsme museli projít pâímo kolem toho.
		AI_Output (self ,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_02"); //Prostę mi pâines ten vak.
	};
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_02"); //Nezapomeŕ se ale pâesvędčit, že tam opravdu je, aă se nevracíš s prázdnou.
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_03"); //Jak to poznám?
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_04"); //Ten vak je plný zlata. Je to spousta zlata!
					
	Info_AddChoice (DIA_DiegoNW_NeedHelp,"Zkusím to tvoje zlato najít.",DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt);		
	
	B_LogEntry (TOPIC_HelpDiegoNW,"Diegovo zlato je ukryto kdesi na staré obchodní cestę, nad opuštęným dolem - tam, kudy kdysi lanovkou dopravovali do kolonie zboží.");
};

FUNC VOID DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt ()
{
	AI_Output (other,self ,"DIA_DiegoNW_NeedHelp_Problem_TryIt_15_00"); //Zkusím to tvoje zlato najít.
	AI_Output (self ,other,"DIA_DiegoNW_NeedHelp_Problem_TryIt_11_01"); //(zašklebí se) Jen do toho. Budeme si kvit.

	Info_ClearChoices (DIA_DiegoNW_NeedHelp);
};

//***********************************************
//	Ok, ich werde dir doch helfen.
//***********************************************

INSTANCE DIA_DiegoNW_HelpYou(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 30;
	condition	= DIA_DiegoNW_HelpYou_Condition;
	information	= DIA_DiegoNW_HelpYou_Info;
	permanent	= FALSE;
	description	= "Dobrá, pâece jenom ti pomůžu.";
};                       
FUNC INT DIA_DiegoNW_HelpYou_Condition()
{
	if (Diego_IsOnBoard == FALSE)
	&& (MIS_HElpDiegoNW == LOG_FAILED) 
	&& (Diego_IsOnBOard != LOG_SUCCESS)
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoNW_HelpYou_Info()
{	
	AI_Output (other,self ,"DIA_DiegoNW_HelpYou_15_00"); //Dobrá, pâece jenom ti pomůžu.
	AI_Output (self ,other,"DIA_DiegoNW_HelpYou_11_01"); //Vędęl jsem to.
	AI_Output (other,self ,"DIA_DiegoNW_HelpYou_15_02"); //Fajn, pâejdęme rovnou k vęci.
	AI_Output (self ,other,"DIA_DiegoNW_HelpYou_11_03"); //Takže. V Hornickém údolí jsem si schoval poklad, a ty mi ho pâineseš.
	AI_Output (self ,other,"DIA_DiegoNW_HelpYou_11_06"); //Já mezitím zůstanu tady a všechno pâipravím.
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold();
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt();

	MIS_HelpDiegoNW = LOG_RUNNING;
	Log_CreateTopic (TOPIC_HelpDiegoNW,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_HelpDiegoNW,LOG_RUNNING);
	B_LogEntry (TOPIC_HelpDiegoNW,"Diegovo zlato je ukryto v Hornickém údolí. Potâebuje se dostat mezi smetánku, a tak mę pro nę poslal.");
};

//***********************************************
//	Ich habe dein Gold gefunden!
//***********************************************

INSTANCE DIA_DiegoNW_HaveYourGold(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 31;
	condition	= DIA_DiegoNW_HaveYourGold_Condition;
	information	= DIA_DiegoNW_HaveYourGold_Info;
	permanent	= TRUE;
	description	= "Našel jsem tvoje zlato!";
};            

FUNC INT DIA_DiegoNW_HaveYourGold_Condition()
{
	if ((OpenedDiegosBag == TRUE)
	|| (Npc_HasItems (other,ItSe_DiegosTreasure_Mis) >=1))
	&& (MIS_HelpDiegoNW == LOG_RUNNING)
	&& (Diego_IsOnBOard != LOG_SUCCESS)
	{
		return TRUE;
	};
};

FUNC VOID B_DIEGONW_DIEGOSREVENGE ()
{
	AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_05"); //Prefekt. Gerbrandt by se męl radši mít na pozoru.
};

var int DiegosRevenge;

FUNC VOID DIA_DiegoNW_HaveYourGold_Info()
{	
	AI_Output (other,self ,"DIA_DiegoNW_HaveYourGold_15_00"); //Našel jsem tvoje zlato!
	AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_01"); //Výbornę. Ukaž.
	
	IF (Npc_HasItems (other,ItSe_DiegosTreasure_Mis) >=1)
	{
		B_GiveInvItems (other,self ,ItSe_DiegosTreasure_Mis,1);
		B_DIEGONW_DIEGOSREVENGE ();
		DiegosRevenge = TRUE;
	}
	else if (Npc_HasItems (other,ItMi_Gold < DiegosTreasure))
	{
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_02"); //Ale to není všechno! Nevęâíš mi? Potâebuju všechno.
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_03"); //Pokud můj plán vyjde, zbude dost i na tebe.
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_04"); //Takže se snaž, aby nic nechybęlo. Je to důležité!
	}
	else
	{
		B_GiveInvItems (other,self ,ItMi_Gold,DiegosTreasure);
		B_DIEGONW_DIEGOSREVENGE ();
		DiegosRevenge = TRUE;
	};	
	
	if (Npc_IsDead (Gerbrandt) == FALSE)
	&& (DiegosRevenge == TRUE)
	{
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_06"); //Poslouchej, ještę se musím postarat o ty stráže.
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_07"); //Chtęl bych, abys donesl tenhle dopis Gerbrandtovi. Je to jeden z tęch tlustých obchodníků v horní čtvrti.
		AI_Output (self ,other,"DIA_DiegoNW_HaveYourGold_11_08"); //Pozdravuj ho ode mne. Pak se s tebou setkám pâed Gerbrandtovým domem.

		CreateInvItems (self ,ItWr_DiegosLetter_MIS,1);
		B_GiveInvItems (self,other,ItWr_DiegosLetter_MIS,1);
		
		B_StartOtherRoutine (Gerbrandt,"WaitForDiego");
		
		MIS_HelpDiegoNW = LOG_SUCCESS;
		MIS_DiegosResidence = LOG_RUNNING;
		B_GivePlayerXP (XP_HelpDiegoNW);

		Log_CreateTopic (TOPIC_DiegosResidence,LOG_MISSION);
		Log_SetTopicStatus (TOPIC_DiegosResidence,LOG_RUNNING);
		B_LogEntry (TOPIC_DiegosResidence,"Diego mi pâedal dopis pro obchodníka Gerbrandta.");
		
		AI_StopProcessInfos (self);
	};		
		
	
};


//***********************************************
//	Ich habe den Brief abgeliefert.
//***********************************************

INSTANCE DIA_DiegoNW_DeliveredLetter(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 30;
	condition	= DIA_DiegoNW_DeliveredLetter_Condition;
	information	= DIA_DiegoNW_DeliveredLetter_Info;
	permanent	= FALSE;
	description	= "Doručil jsem ten dopis.";
};
                       
FUNC INT DIA_DiegoNW_DeliveredLetter_Condition()
{
	if (Diego_IsOnBoard == FALSE)
	&& (MIS_DiegosResidence == LOG_SUCCESS)
	{
		return TRUE;
	};
};

FUNC VOID DIA_DiegoNW_DeliveredLetter_Info()
{
		
	AI_Output (other,self ,"DIA_DiegoNW_DeliveredLetter_15_00"); //Doručil jsem ten dopis.
	AI_Output (self ,other,"DIA_DiegoNW_DeliveredLetter_11_01"); //Velmi dobâe. Jak to Gerbrandt vzal?
	AI_Output (other,self ,"DIA_DiegoNW_DeliveredLetter_15_02"); //Vypadal docela šokovanę a okamžitę se ztratil.
	AI_Output (self ,other,"DIA_DiegoNW_DeliveredLetter_11_03"); //(spokojenę) To bych âekl.
	AI_Output (self ,other,"DIA_DiegoNW_DeliveredLetter_11_04"); //Obávám se, že ze všeho nejdâív budu muset dohlídnout na vybavení svýho novýho domu. Jestli si dobâe pamatuju, tak Gerbrandt męl strašnej vkus, co se nábytku týká.
	  
	B_GivePlayerXP (XP_DiegoHasANewHome);

	Wld_AssignRoomToGuild ("reich01",		GIL_PUBLIC);

	Info_ClearChoices (DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice (DIA_DiegoNW_DeliveredLetter,"A jak jsi to vlastnę udęlal?",DIA_DiegoNW_DeliveredLetter_YourTrick);	
	Info_AddChoice (DIA_DiegoNW_DeliveredLetter,"Takže ten dům je tvůj?",DIA_DiegoNW_DeliveredLetter_YourHouse);
};

FUNC VOID DIA_DiegoNW_DeliveredLetter_Gerbrandt ()
{
	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_15_00"); //A co Gerbrandt?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_01"); //Už si užíval toho pohodlnýho života dost dlouho.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_02"); //On si žil tady, uprostâed luxusu, zatímco já dlabal v dolech vývar z krys.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_03"); //Netuším, kam męl namíâeno, ale do Khorinidu už nikdy nevkročí - na to dohlídnu.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_04"); //Kdybys ho hledal, najdeš ho asi v pâístavní čtvrti.
};

FUNC VOID DIA_DiegoNW_DeliveredLetter_YourHouse()
{
	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_00"); //Takže ten dům je tvůj?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_01"); //Ano, od sklepa až po půdu, včetnę všeho nábytku.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_02"); //Po nękolika letech strávených ve vší tý mizérii se tęším, až se vyspím v posteli s nebesama.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_03"); //A k snídani si pak dám dobrý víno a šăavnatou šunčičku.
	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_04"); //Chytáš štęstí za pačesy, co?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_05"); //Se vsaë.
};

FUNC VOID DIA_DiegoNW_DeliveredLetter_YourTrick ()
{
	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_00"); //A jak jsi to vlastnę udęlal?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_01"); //Myslíš snad, že Gerbrandt pâišel ke všemu tomu bohatství poctivým obchodem?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_02"); //Když pâišlo na nęjakou levotu, tak si sám ruce pochopitelnę nikdy nezašpinil. Na to męl pomocníka.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_03"); //Samozâejmę že jsem tu a tam nęco pochytil. Gerbrandt se mę nakonec zbavil. Nejspíš se bál, že toho vím moc.
	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_04"); //O tom jsi mi nikdy neâekl.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_05"); //Nikdy ses neptal.
	
	Info_ClearChoices (DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice (DIA_DiegoNW_DeliveredLetter,DIALOG_BACK,DIA_DiegoNW_DeliveredLetter_YourTrick_BACK);
	Info_AddChoice (DIA_DiegoNW_DeliveredLetter,"A co můj podíl?",DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD);
	Info_AddChoice (DIA_DiegoNW_DeliveredLetter,"A co Gerbrandt?",DIA_DiegoNW_DeliveredLetter_Gerbrandt);
}; 

FUNC VOID DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD()
{

	AI_Output (other,self ,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_15_00"); //A co můj podíl?
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_01"); //Zdá se, žes nakonec pâece jenom nezapomnęl na všechno, co jsem tę naučil.
	AI_Output (self ,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_02"); //Ale máš pravdu, bez tebe bych to nedokázal. Tady je tvůj díl.
	
	CreateInvItems (self ,ItMi_Gold,500);
	B_GiveInvItems (self,other,ItMi_Gold,500);
};

FUNC VOID DIA_DiegoNW_DeliveredLetter_YourTrick_BACK()
{
	Info_ClearChoices (DIA_DiegoNW_DeliveredLetter);
};


// ************************************************************
// 	  	  Kannst du mir was beibringen?
// ************************************************************

//---------------------------
var int Diego_Teach;
//---------------------------

INSTANCE DIA_DiegoNW_CanYouTeach(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 995;
	condition	= DIA_DiegoNW_CanYouTeach_Condition;
	information	= DIA_DiegoNW_CanYouTeach_Info;
	permanent	= TRUE;

	description = "Můžeš mę nęčemu naučit?";
};                       
FUNC INT DIA_DiegoNW_CanYouTeach_Condition()
{
	if (Diego_IsOnBoard == FALSE)
	&& (Diego_Teach == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoNW_CanYouTeach_Info()
{	
	AI_Output (other,self ,"DIA_DiegoNW_CanYouTeach_15_00"); //Můžeš mę nęčemu naučit?
	if (Npc_KnowsInfo (other,DIA_DiegoNW_DeliveredLetter))
	{
		AI_Output (self ,other,"DIA_DiegoNW_CanYouTeach_11_01"); //Ale jistę. Jen mi âekni, až budeš pâipravený.
		
		Diego_Teach = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_DiegoNW_CanYouTeach_11_02"); //Nejdâív se musím postarat o vlastní záležitosti.
	};
};



// ************************************************************
// 	  	  Bring mir was bei.
// ************************************************************

//-----------------------
var int DiegoNW_Merke_DEX;
//-------------------------

INSTANCE DIA_DiegoNW_Teach(C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 995;
	condition	= DIA_DiegoNW_Teach_Condition;
	information	= DIA_DiegoNW_Teach_Info;
	permanent	= TRUE;

	description = "Můžeš mę nęčemu naučit?";
};                       
FUNC INT DIA_DiegoNW_Teach_Condition()
{
	if (Diego_IsOnBoard == FALSE)
	&& (Diego_Teach == TRUE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_DiegoNW_Teach_Info()
{	
	AI_Output (other,self ,"DIA_DiegoNW_Teach_15_00"); //Uč mę.
	AI_Output (self ,other,"DIA_DiegoNW_Teach_11_01"); //Naučím tę, jak být o nęco obratnęjší.
	
	DiegoNW_Merke_Dex = other.attribute[ATR_DEXTERITY];
	
	Info_ClearChoices	(DIA_DiegoNW_Teach);
	Info_AddChoice		(DIA_DiegoNW_Teach, DIALOG_BACK, DIA_DiegoNW_Teach_BACK);
	Info_AddChoice		(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice		(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoNW_TeachDEX_5);
};

func void DIA_DiegoNW_Teach_BACK()
{
	if (DiegoNW_Merke_DEX < other.attribute[ATR_DEXTERITY])
	{
		AI_Output (self, other, "DIA_DiegoNW_Teach_BACK_11_00"); //Už jsi obratnęjší. Jen tak dál!
	};
	Info_ClearChoices	(DIA_DiegoNW_Teach);
};

// ------ 1 Geschick -----
func void DIA_DiegoNW_TeachDEX_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MAX);

	Info_ClearChoices	(DIA_DiegoNW_Teach);
	Info_AddChoice		(DIA_DiegoNW_Teach, DIALOG_BACK, DIA_DiegoNW_Teach_BACK);
	Info_AddChoice		(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice		(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoNW_TeachDEX_5);
};

// ------ 5 Geschick ------
func void DIA_DiegoNW_TeachDEX_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MAX);
	
	Info_ClearChoices	(DIA_DiegoNW_Teach);
	Info_AddChoice		(DIA_DiegoNW_Teach, DIALOG_BACK, DIA_DiegoNW_Teach_BACK);
	Info_AddChoice		(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY))	,DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice		(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_DiegoNW_TeachDEX_5);
};

//######################################
//##
//##	Kapitel 5
//##
//######################################

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_DiegoNW_KnowWhereEnemy		(C_INFO)
{
	npc			 = 	PC_Thief_NW;
	nr			 = 	55;
	condition	 = 	DIA_DiegoNW_KnowWhereEnemy_Condition;
	information	 = 	DIA_DiegoNW_KnowWhereEnemy_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Odcházím z Khorinidu.";
};

func int DIA_DiegoNW_KnowWhereEnemy_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Diego_IsOnBoard == FALSE) 
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_KnowWhereEnemy_Info ()
{
	AI_Output			(other, self, "DIA_DiegoNW_KnowWhereEnemy_15_00"); //Odcházím z Khorinidu.
	AI_Output			(self, other, "DIA_DiegoNW_KnowWhereEnemy_11_01"); //Moudré rozhodnutí. Pâál bych si jít s tebou. Tohle męsto se až moc rychle zmęnilo - časy, kdy jsi mohl rychle zbohatnout, už jsou pryč.
	AI_Output			(self, other, "DIA_DiegoNW_KnowWhereEnemy_11_02"); //Mohl bych tę učit lučištnictví, páčení zámků a navyšování obratnosti.
	AI_Output			(self, other, "DIA_DiegoNW_KnowWhereEnemy_11_03"); //Navíc by se ti určitę hodil nęjaký slušný zlodęj.
	
	Log_CreateTopic (TOPIC_Crew, LOG_MISSION);   	
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING);
	B_LogEntry (TOPIC_Crew,"Diego chce jít samozâejmę se mnou. Vidí to tak, že čím dâív Khorinis opustí, tím líp. Mohl by mi ukázat, jak se stát obratnęjším, a vycvičit mę v lukostâelbę. Také se se mnou podęlí o umęní páčit zámky.");	
		
	if (crewmember_count >= Max_Crew)
	{
		AI_Output			(other,self , "DIA_DiegoNW_KnowWhereEnemy_15_04"); //Nechám si to projít hlavou. Momentálnę je moje posádka v plném stavu.
		AI_Output			(self, other, "DIA_DiegoNW_KnowWhereEnemy_11_05"); //Rozmysli si to. Tak jako tak mę najdeš tady.
	}
	else 
	{
		Info_ClearChoices (DIA_DiegoNW_KnowWhereEnemy);
		Info_AddChoice (DIA_DiegoNW_KnowWhereEnemy,"Snad ti dám vędęt, až pâijde ten pravý čas.",DIA_DiegoNW_KnowWhereEnemy_No);
		Info_AddChoice (DIA_DiegoNW_KnowWhereEnemy,"Nechceš jít taky?",DIA_DiegoNW_KnowWhereEnemy_Yes);
	};
};

FUNC VOID DIA_DiegoNW_KnowWhereEnemy_Yes ()
{
	AI_Output (other,self ,"DIA_DiegoNW_KnowWhereEnemy_Yes_15_00"); //Tak pojeë se mnou. Setkáme se v pâístavu.
	AI_Output (self ,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_01"); //Hmm. Máš pravdu, Khorinis je žumpa. Jdu s tebou.
	
	
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Diego_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	
	B_GivePlayerXP (XP_Crewmember_Success); 
	
	if (Hlp_StrCmp(Npc_GetNearestWP(self), "NW_CITY_UPTOWN_PATH_23" )== 1)
    {
		AI_Output (self ,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_02"); //Počkej, za minutu budu pâipravenej.
		AI_SetWalkmode 	(self, NPC_WALK);		
		AI_GotoWP (self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems (self,ItAR_Diego,1);
		AI_EquipArmor (self,ItAr_Diego);
		AI_Wait (self ,1);
		AI_GotoWP (self,self.wp);
	};
	
	AI_Output (self ,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_03"); //Tak, jsem pâipravenej. Uvidíme se u lodi.
	
	
	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine (self,"SHIP"); 
	}
	else
	{
		Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
	};

	Info_ClearChoices (DIA_DiegoNW_KnowWhereEnemy);
};

FUNC VOID DIA_DiegoNW_KnowWhereEnemy_No ()
{
	AI_Output (other,self ,"DIA_DiegoNW_KnowWhereEnemy_No_15_00"); //Možná ti dám vędęt, až nadejde čas.
	AI_Output (self ,other,"DIA_DiegoNW_KnowWhereEnemy_No_11_01"); //Jak myslíš. A možná s tebou dokonce i půjdu. Kdo ví?

	Diego_IsOnBoard	 = LOG_OBSOLETE;
	Info_ClearChoices (DIA_DiegoNW_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_DiegoNW_LeaveMyShip		(C_INFO)
{
	npc			 = 	PC_Thief_NW;
	nr			 = 	55;
	condition	 = 	DIA_DiegoNW_LeaveMyShip_Condition;
	information	 = 	DIA_DiegoNW_LeaveMyShip_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Dohlídni radši na męsto.";
};
func int DIA_DiegoNW_LeaveMyShip_Condition ()
{	
	if (Diego_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE)
	{
		return TRUE;
	};
};
func void DIA_DiegoNW_LeaveMyShip_Info ()
{
	AI_Output			(other, self, "DIA_DiegoNW_LeaveMyShip_15_00"); //Dohlídni radši na męsto.
	AI_Output			(self, other, "DIA_DiegoNW_LeaveMyShip_11_01"); //Vážnę? Už mę nepotâebuješ? No dobrá. Nezapomeŕ se stavit, až budeš zpátky ve męstę.
	AI_Output			(other, self, "DIA_DiegoNW_LeaveMyShip_15_02"); //Myslíš, že se ještę setkáme?
	AI_Output			(self, other, "DIA_DiegoNW_LeaveMyShip_11_03"); //Nikdy nezapomenu na ten výraz, co jsi męl ve tváâi, když ses válel po zemi po té ránę od Bullita a my se poprvé setkali.
	AI_Output			(self, other, "DIA_DiegoNW_LeaveMyShip_11_04"); //Nemají šanci sehnat nękoho lepšího, než jsi ty. MĘLI bychom se znovu setkat. Dávej na sebe pozor.
	
	
	Diego_IsOnBoard	 = LOG_OBSOLETE;				//Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit! 
	crewmember_Count = (Crewmember_Count -1);
	
	Npc_ExchangeRoutine (self,"Začít"); 
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_DiegoNW_StillNeedYou		(C_INFO)
{
	npc			 = 	PC_Thief_NW;
	nr			 = 	55;
	condition	 = 	DIA_DiegoNW_StillNeedYou_Condition;
	information	 = 	DIA_DiegoNW_StillNeedYou_Info;
	PERMANENT 	 =  TRUE;
	description	 = 	"Rozmyslel jsem si to. Chci, abys šel se mnou.";
};

func int DIA_DiegoNW_StillNeedYou_Condition ()
{	
	if ((Diego_IsOnBOard == LOG_OBSOLETE)	
	|| (Diego_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew)
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_StillNeedYou_Info ()
{
	AI_Output	(other, self, "DIA_DiegoNW_StillNeedYou_15_00"); //Rozmyslel jsem si to. Chci, abys šel se mnou.
	AI_Output	(self, other, "DIA_DiegoNW_StillNeedYou_11_01"); //Kam se podęla tvoje rozhodnost? Jasnę že s tebou půjdu - ale už se sakra rozhodni.
		
	self.flags 		 = NPC_FLAG_IMMORTAL;
	Diego_IsOnBoard	 = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count +1);
	
	if (Hlp_StrCmp(Npc_GetNearestWP(self), "NW_CITY_UPTOWN_PATH_23" )== 1)
    {
		AI_Output (self ,other,"DIA_DiegoNW_StillNeedYou_11_02"); //Počkej, za minutu budu pâipravenej.
		AI_GotoWP (self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems (self,ItAR_Diego,1);
		AI_EquipArmor (self,ItAr_Diego);
		AI_GotoWP (self,self.wp);
	};
	
	AI_Output	(self, other, "DIA_DiegoNW_StillNeedYou_11_03"); //Dobrá, můžeme jít.
	
	AI_StopProcessInfos (self);

	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine (self,"SHIP"); 
	}
	else
	{
		Npc_ExchangeRoutine (self,"WAITFORSHIP"); 
	};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Thief_NW_PICKPOCKET (C_INFO)
{
	npc			= PC_Thief_NW;
	nr			= 900;
	condition	= DIA_Thief_NW_PICKPOCKET_Condition;
	information	= DIA_Thief_NW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_Thief_NW_PICKPOCKET_Condition()
{
	C_Beklauen (120, 600);
};
 
FUNC VOID DIA_Thief_NW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Thief_NW_PICKPOCKET);
	Info_AddChoice		(DIA_Thief_NW_PICKPOCKET, DIALOG_BACK 		,DIA_Thief_NW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Thief_NW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Thief_NW_PICKPOCKET_DoIt);
};

func void DIA_Thief_NW_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Thief_NW_PICKPOCKET);
};
	
func void DIA_Thief_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Thief_NW_PICKPOCKET);
};


