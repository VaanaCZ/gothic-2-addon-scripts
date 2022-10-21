// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Hanna_EXIT(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 999;
	condition	= DIA_Hanna_EXIT_Condition;
	information	= DIA_Hanna_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Hanna_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Hanna_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hello 
// ************************************************************

INSTANCE DIA_Hanna_Hello(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_Hello_Condition;
	information	= DIA_Hanna_Hello_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Hanna_Hello_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Hanna_Hello_Info()
{	
	AI_Output (self ,other,"DIA_Hanna_Hello_17_00"); //Á, zákazník - èímpak poslouím?
};	

//*****************************************
//	Ich suche ein Zimmer
//*****************************************
INSTANCE DIA_Hanna_Room(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 2;
	condition	= DIA_Hanna_Room_Condition;
	information	= DIA_Hanna_Room_Info;
	permanent	= FALSE;
	description	= "Hledám pokoj.";
};                       

FUNC INT DIA_Hanna_Room_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Hanna_Room_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_Room_15_00"); //Hledám pokoj.
	AI_Output (self ,other,"DIA_Hanna_Room_17_01"); //Tak to jsi na správném místì.
	if (Npc_KnowsInfo (other, DIA_Lothar_Schlafen))
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_03"); //Jeden z paladinù mi naznaèil, e bych tu mohl pøespat i zadarmo.
	}
	else
	{
		AI_Output (other, self, "DIA_Hanna_Add_15_00"); //Kolik stojí noc?
		AI_Output (self, other, "DIA_Hanna_Add_17_01"); //Vùbec nic.
		AI_Output (self, other, "DIA_Hanna_Add_17_02"); //Ubytování poutníkù jde na úèet paladinùm.
		AI_Output (other, self, "DIA_Hanna_Add_15_04"); //Take tu mùu zùstat zadarmo?
	};
	
	AI_Output (self, other, "DIA_Hanna_Add_17_05"); //Ano, ano.
	AI_Output (self, other, "DIA_Hanna_Add_17_06"); //Prostì vyjdi po schodech nahoru.
	AI_Output (self, other, "DIA_Hanna_Add_17_07"); //Ještì tam máme dvì postele volné.
	//AI_Output (self ,other,"DIA_Hanna_Room_17_02"); //Geh einfach nach oben und suche dir ein Bett.
};

//*****************************************
//	WhyPay
//*****************************************
INSTANCE DIA_Hanna_WhyPay(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 3;
	condition	= DIA_Hanna_WhyPay_Condition;
	information	= DIA_Hanna_WhyPay_Info;
	permanent	= FALSE;
	description	= "Proè paladinové za všechno platí?";
};                       

FUNC INT DIA_Hanna_WhyPay_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Room))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hanna_WhyPay_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_12"); //Proè paladinové za všechno platí?
	AI_Output (self, other, "DIA_Hanna_Add_17_13"); //Nevím, ale nejspíš v tom bude víc vìcí najednou.
	AI_Output (self, other, "DIA_Hanna_Add_17_14"); //Jednak chtìjí, aby se po ulici netoulala ádná pochybná sebranka a zbyteènì tu nedìlala bordel.
	AI_Output (self, other, "DIA_Hanna_Add_17_15"); //A taky si moná chtìjí na svou stranu naklonit potulné kupce.
	AI_Output (self, other, "DIA_Hanna_Add_17_16"); //Teï, kdy se sedláci bouøí, je naše zásobování závislé hlavnì na obchodnících.
	AI_Output (self, other, "DIA_Hanna_Add_17_17"); //A kromì toho bych øekla, e taky chtìjí ve mìstì trochu pozvednout morálku.
	AI_Output (self, other, "DIA_Hanna_Add_17_18"); //Lord Andre dokonce naøídil, aby na šibenièním námìstí nalévali jedno pivo zdarma.
};

//*****************************************
//	WerHier - PERM
//*****************************************
INSTANCE DIA_Hanna_WerHier(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 4;
	condition	= DIA_Hanna_WerHier_Condition;
	information	= DIA_Hanna_WerHier_Info;
	permanent	= TRUE;
	description	= "Kdo tady zrovna je?";
};                       

FUNC INT DIA_Hanna_WerHier_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Room))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Hanna_WerHier_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_08"); //Kdo tady zrovna je?
	AI_Output (self, other, "DIA_Hanna_Add_17_09"); //Skoro všechno jsou potulní trhovci.
	AI_Output (other, self, "DIA_Hanna_Add_15_10"); //Aha.
	AI_Output (self, other, "DIA_Hanna_Add_17_11"); //A tì ani nenapadne, e bys jim šel "zkontrolovat" zboí! Nechci tu mít ádné nepøíjemnosti!
};

//**********************************************
//	Ich hab noch ein paar Fragen zur Stadt
//**********************************************

INSTANCE DIA_Hanna_City(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 5;
	condition	= DIA_Hanna_City_Condition;
	information	= DIA_Hanna_City_Info;
	permanent	= TRUE;
	description	= "Mìl bych pár otázek ohlednì mìsta...";
};                       

FUNC INT DIA_Hanna_City_Condition()
{
		return TRUE;	
};
 
FUNC VOID DIA_Hanna_City_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_City_15_00"); //Mìl bych pár otázek ohlednì mìsta...
	
	Info_ClearChoices (DIA_Hanna_City);
	Info_AddChoice (DIA_Hanna_City,DIALOG_BACK,DIA_Hanna_City_Back);
	Info_AddChoice (DIA_Hanna_City,"Kde bych si tu mohl nìco nakoupit?",DIA_Hanna_City_Buy);
	Info_AddChoice (DIA_Hanna_City,"Povìz mi nìco o mìstì.",DIA_Hanna_City_City);
};

FUNC VOID DIA_Hanna_City_Back ()
{
	Info_ClearChoices (DIA_Hanna_City);
};

FUNC VOID DIA_Hanna_City_Buy ()
{
	AI_Output (other,self ,"DIA_Hanna_City_Buy_15_00"); //Kde bych si tu mohl nìco nakoupit?
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_01"); //Pøímo naproti dveøím je trištì, tam bys mìl najít všechno, co potøebuješ.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_02"); //Na druhé stranì mìsta najdeš pár øemeslnickıch krámkù. Vìtšina z nich leí poblí druhé mìstské brány.
	AI_Output (self ,other,"DIA_Hanna_City_Buy_17_03"); //V pøístavu také mùeš zajít k rybáøi. Jeho obchod se nachází pøímo v pøístavu, najdeš to snadno.
};

FUNC VOID DIA_Hanna_City_City ()
{
	AI_Output (other,self ,"DIA_Hanna_City_City_15_00"); //Povìz mi nìco o mìstì.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_01"); //Khorinis je jedním z nejbohatších mìst v království, i kdy teï to tak nevypadá.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_02"); //Ale od té doby, co zaèaly ty problémy se skøety, se obchod témìø zastavil. Král toti naverboval do armády celou kupeckou flotilu.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_03"); //To znamená, e do pøístavu teï ádné lodi neplují a zásoby zboí se rapidnì tenèí. Spousta zdejších obyvatel se proto bojí, co bude dál.
	AI_Output (self ,other,"DIA_Hanna_City_City_17_04"); //Nikdo neví pøesnì, co nám budoucnost pøinese. Vlastnì nemùeme dìlat nic jiného, ne tu sedìt a èekat, co se stane. Nezdá se, e bychom mohli nìco zmìnit.
};



//##################################
//##
//##	Kapitel 3
//##
//##################################

// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Hanna_Kap3_EXIT(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 999;
	condition	= DIA_Hanna_Kap3_EXIT_Condition;
	information	= DIA_Hanna_Kap3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Hanna_Kap3_EXIT_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_Kap3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

var int Hanna_PriceForLetter;

// ************************************************************
// 		Wie sieht´s aus?
// ************************************************************
INSTANCE DIA_Hanna_AnyNews(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 31;
	condition	= DIA_Hanna_AnyNews_Condition;
	information	= DIA_Hanna_AnyNews_Info;
	permanent	= FALSE;
	description = "Jak to jde?";
};                       
FUNC INT DIA_Hanna_AnyNews_Condition()
{
	if (Kapitel >= 3 )
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_AnyNews_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_AnyNews_15_00"); //Jak se vede?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_17_01"); //Nevypadáš, e by tì problémy druhıch lidí nìjak zvláš zajímaly.
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Ano, jistì, samozøejmì.",DIA_Hanna_AnyNews_Yes);
	Info_AddChoice (DIA_Hanna_AnyNews,"Pøijde na to.",DIA_Hanna_AnyNews_Depends);
	Info_AddChoice (DIA_Hanna_AnyNews,"Vlastnì ne.",DIA_Hanna_AnyNews_No);
};

FUNC VOID DIA_Hanna_AnyNews_No ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_No_15_00"); //Vlastnì ne.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_No_17_01"); //Pøesnì jak øíkám. Nikdo tu nemyslí na nic jiného ne jenom na sebe. Take co chceš?

	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Depends ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Depends_15_00"); //Pøijde na to.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_01"); //To jako e pøijde na to, co ti z toho kápne.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Depends_17_02"); //Takové jako ty tu nemùu vystát.


	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_15_00"); //Jo, jasnì.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_01"); //Co ty víš, svìt je plnı pøekvapení. Nedávno jsem dìlala poøádek ve zboí a pøi té pøíleitosti jsem prodala štùsek map Brahimovi, kartografovi dole v pøístavu.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_02"); //Bohuel jsem ale vzápìtí zjistila, e mi chybí jeden dokument.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_03"); //Poèítám, e se musel nìjak pøimotat mezi ty papíry.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_17_04"); //Nemohl bys mi ho pøinést zpátky?
	
	MIS_HannaRetrieveLetter = LOG_RUNNING;

	Log_CreateTopic (TOPIC_HannaRetrieveLetter, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HannaRetrieveLetter, LOG_RUNNING);
	B_LogEntry (TOPIC_HannaRetrieveLetter,"Hannì se ztratil nìjakı dokument. Nejspíš jí zmizel v pøístavu - tam, kde sídlí kartograf Brahim."); 


	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"Nejsem ádnı poslíèek.",DIA_Hanna_AnyNews_Yes_Footboy);
	Info_AddChoice (DIA_Hanna_AnyNews,"Co z toho budu mít?",DIA_Hanna_AnyNews_Yes_Reward);
	Info_AddChoice (DIA_Hanna_AnyNews,"Uvidím, co se dá dìlat.",DIA_Hanna_AnyNews_Yes_WillSee);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Footboy ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Footboy_15_00"); //Nejsem ádnı poslíèek.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Footboy_17_01"); //Chápu - problémy obyèejné eny ti nestojí za námahu. No dobøe, tak se o to budu muset postarat sama.

	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_15_00"); //Co z toho budu mít?
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_01"); //Aha, já to vìdìla - nejsi o nic lepší ne ta lùza dole v pøístavu.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_17_02"); //Take co chceš po ubohé enì?
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
	Info_AddChoice (DIA_Hanna_AnyNews,"To nic.",DIA_Hanna_AnyNews_Yes_Reward_OK);
	Info_AddChoice (DIA_Hanna_AnyNews,"Taky bys ke mnì mohla bıt trochu vlídnìjší.",DIA_Hanna_AnyNews_Yes_Reward_BeNice);
	Info_AddChoice (DIA_Hanna_AnyNews,"Zlato.",DIA_Hanna_AnyNews_Yes_Reward_Gold);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_OK ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_OK_15_00"); //Vlastnì nic.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_OK_17_01"); //Aspoò e v tobì zbyla trocha slušnosti. Kdy mi ten dokument pøineseš, dostaneš ode mì 75 zlaákù.

	Hanna_PriceForLetter = 75;
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_BeNice ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00"); //Taky bys ke mnì mohla bıt trochu vlídnìjší.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01"); //To je ale hnusné! Já... zmiz odsud! Ty nevychovanı hulváte!
	
	MIS_HannaRetrieveLetter = LOG_FAILED;
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Hanna_AnyNews_Yes_Reward_Gold ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00"); //Zlato.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01"); //Nemùu ti nabídnout víc ne mrzkı peníz. No - cením si to na 50 zlaákù.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02"); //Jestli se ti podaøí ten dokument získat zpátky, dám ti 50 zlaákù.

	Hanna_PriceForLetter = 50;

	Info_ClearChoices (DIA_Hanna_AnyNews);
};	

FUNC VOID DIA_Hanna_AnyNews_Yes_WillSee ()
{
	AI_Output (other,self ,"DIA_Hanna_AnyNews_Yes_WillSee_15_00"); //Uvidím, co se dá dìlat.
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_01"); //To je od tebe milé! Hodnì štìstí!
	AI_Output (self ,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_02"); //Kdy mi ten dokument pøineseš zpátky, odmìním se ti.
	
	Hanna_PriceForLetter = 200;
	
	Info_ClearChoices (DIA_Hanna_AnyNews);
};


// ************************************************************
//		Meinst du dieses Schriftstück?
// ************************************************************
INSTANCE DIA_Hanna_ThisLetter(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 31;
	condition	= DIA_Hanna_ThisLetter_Condition;
	information	= DIA_Hanna_ThisLetter_Info;
	permanent	= FALSE;
	description = "Myslelas tenhle dokument?";
};                       
FUNC INT DIA_Hanna_ThisLetter_Condition()
{
	if (MIS_HannaRetrieveLetter == LOG_RUNNING)
	&& (Npc_HasItems (other,ItWr_ShatteredGolem_Mis) >= 1)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Hanna_ThisLetter_Info()
{	
	AI_Output (other,self ,"DIA_Hanna_ThisLetter_15_00"); //Myslelas tenhle dokument?
	AI_Output (self ,other,"DIA_Hanna_ThisLetter_17_01"); //Ano, to je pøesnì ono. Dìkuji ti.
	AI_Output (other,self ,"DIA_Hanna_ThisLetter_15_02"); //A co má odmìna?
	AI_Output (self ,other,"DIA_Hanna_ThisLetter_17_03"); //Ne tak zhurta. Tady máš peníze.
		
	CreateInvItems (self,ItMi_Gold,Hanna_PriceForLetter);
	B_GiveInvItems (self,other,ItMi_Gold,Hanna_PriceForLetter);
	
	MIS_HannaRetrieveLetter = LOG_SUCCESS;
	B_GivePlayerXP (XP_HannaRetrieveLetter);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Hanna_PICKPOCKET (C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 900;
	condition	= DIA_Hanna_PICKPOCKET_Condition;
	information	= DIA_Hanna_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Hanna_PICKPOCKET_Condition()
{
	C_Beklauen (45, 25);
};
 
FUNC VOID DIA_Hanna_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Hanna_PICKPOCKET);
	Info_AddChoice		(DIA_Hanna_PICKPOCKET, DIALOG_BACK 		,DIA_Hanna_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Hanna_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Hanna_PICKPOCKET_DoIt);
};

func void DIA_Hanna_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Hanna_PICKPOCKET);
};
	
func void DIA_Hanna_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Hanna_PICKPOCKET);
};


// ************************************************************
//						Aus Keller
// ************************************************************

INSTANCE DIA_Hanna_AusKeller(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 11;
	condition	= DIA_Hanna_AusKeller_Condition;
	information	= DIA_Hanna_AusKeller_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       
FUNC INT DIA_Hanna_AusKeller_Condition()
{
	if (Npc_HasItems (other, ItKe_ThiefGuildKey_Hotel_MIS) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_AusKeller_Info()
{	
	if (Cassia.aivar[AIV_KilledByPlayer] == TRUE)
	|| (Jesper.aivar[AIV_KilledByPlayer] == TRUE)
	|| (Ramirez.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (self, other, "DIA_Hanna_Add_17_27"); //Odkud... jsi to pøišel?
		AI_Output (other, self, "DIA_Hanna_Add_15_28"); //U tebe ve sklepì jsem našel cosi velmi zajímavého.
		AI_Output (self, other, "DIA_Hanna_Add_17_29"); //A co jsi dìlal u mì ve sklepì?
		AI_Output (other, self, "DIA_Hanna_Add_15_30"); //To víš zatracenì dobøe!
		AI_Output (self, other, "DIA_Hanna_Add_17_31"); //(chladnì) Nemám ponìtí, o èem to mluvíš.
	}
	else 
	{
		AI_Output (self, other, "DIA_Hanna_Add_17_19"); //(nedùvìøivì) Jen se na sebe podívej! Odkud jsi to pøišel, co?
		AI_Output (other, self, "DIA_Hanna_Add_15_20"); //(rozpaèitì) Já...
		AI_Output (self, other, "DIA_Hanna_Add_17_21"); //(usmìje se) Já vím!
		AI_Output (self, other, "DIA_Hanna_Add_17_22"); //(spiklenecky) Nemusíš mi nic øíkat - vím všechno.
		AI_Output (self, other, "DIA_Hanna_Add_17_23"); //A tì ani nenapadne nìco tady ukrást, jasné?
		AI_Output (self, other, "DIA_Hanna_Add_17_24"); //U se nemùeme hotelu dále vìnovat.
	};	
	
	AI_StopProcessInfos (self);
};

// ************************************************************
//						Schuldenbuch zeigen
// ************************************************************

INSTANCE DIA_Hanna_Schuldenbuch(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_Schuldenbuch_Condition;
	information	= DIA_Hanna_Schuldenbuch_Info;
	permanent	= FALSE;
	description	= "Podívej, jakou knihu tu mám!";
};                       
FUNC INT DIA_Hanna_Schuldenbuch_Condition()
{
	if (Npc_HasItems (other, ItWr_Schuldenbuch) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_Schuldenbuch_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_41"); //Podívej, jakou knihu tu mám!
	AI_Output (self, other, "DIA_Hanna_Add_17_42"); //Lehmarova úèetní kniha. Jak jsi k ní pøišel?
	AI_Output (other, self, "DIA_Hanna_Add_15_43"); //No...
	AI_Output (self, other, "DIA_Hanna_Add_17_44"); //Pokud u ji Lehmar nemá, je to dobrá vìc. Stejnì bych ji ale radši ukryla u sebe.
};

// ************************************************************
//						Schuldenbuch geben
// ************************************************************
instance DIA_Hanna_GiveSchuldenbuch(C_INFO)
{
	npc			= VLK_414_Hanna;
	nr			= 1;
	condition	= DIA_Hanna_GiveSchuldenbuch_Condition;
	information	= DIA_Hanna_GiveSchuldenbuch_Info;
	permanent	= FALSE;
	description = "Tumáš - klidnì si tu knihu vezmi.";
};                       
FUNC INT DIA_Hanna_GiveSchuldenbuch_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Hanna_Schuldenbuch))
	&& (Npc_HasItems (other, ItWr_Schuldenbuch) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Hanna_GiveSchuldenbuch_Info()
{	
	AI_Output (other, self, "DIA_Hanna_Add_15_45"); //Tumáš - klidnì si tu knihu vezmi.
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (self, other, "DIA_Hanna_Add_17_46"); //Díky.
	AI_Output (self, other, "DIA_Hanna_Add_17_47"); //Tady máš nìco za odmìnu.
	B_GiveInvItems (self, other, ItSe_HannasBeutel, 1);
	B_GivePlayerXP (XP_Schuldenbuch);
	AI_Output (other, self, "DIA_Hanna_Add_15_49"); //Co jsi mi to dala?
	AI_Output (self, other, "DIA_Hanna_Add_17_48"); //Je to klíè od brány bohatství.
};


// ************************************************************
// 			  				
// ************************************************************
func void Hanna_Blubb()
{
	AI_Output (other, self, "DIA_Hanna_Add_15_37"); //Je v úkrytu všechno v poøádku?
	AI_Output (self, other, "DIA_Hanna_Add_17_39"); //U jsem nikoho z nich nìjakou dobu nevidìla.
	AI_Output (self, other, "DIA_Hanna_Add_17_40"); //Mìl bych sejít tam dolù a trochu to tam prošetøit.
	AI_Output (self, other, "DIA_Hanna_Add_17_38"); //Ano, ale radši bys o tom nemìl mluvit.
	//-------------------
	AI_Output (other, self, "DIA_Hanna_Add_15_25"); //U jsi zjistil, kde se skrıvají zlodìji?
	AI_Output (self, other, "DIA_Hanna_Add_17_26"); //(domıšlivì) Nemám potuchy, o èem to mluvíš.
	//-------------------
	AI_Output (self, other, "DIA_Hanna_Add_17_32"); //Vtrhla sem domobrana - nìkdo vyzradil naši skrıš!
	AI_Output (self, other, "DIA_Hanna_Add_17_33"); //Mnì nemìli co pøišít, ale Cassia je mrtvá a její lidé taky!
	AI_Output (self, other, "DIA_Hanna_Add_17_34"); //Urèitì jsi to byl TY.
	AI_Output (self, other, "DIA_Hanna_Add_17_35"); //Tohle jsem koupila zvláš pro tebe.
	AI_Output (self, other, "DIA_Hanna_Add_17_36"); //Stálo mì to sice majlant, ale ty si to fakt zaslouíš, ty svinì podrazácká.
};	

	
