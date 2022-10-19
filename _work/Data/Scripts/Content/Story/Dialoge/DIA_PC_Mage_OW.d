


// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_MiltenOW_EXIT(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 999;
	condition	= DIA_MiltenOW_EXIT_Condition;
	information	= DIA_MiltenOW_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_MiltenOW_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_MiltenOW_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  		Hallo
// ************************************************************

INSTANCE DIA_MiltenOW_Hello (C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= TRUE;
	condition	= DIA_MiltenOW_Hello_Condition;
	information	= DIA_MiltenOW_Hello_Info;
	permanent	= FALSE;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_MiltenOW_Hello_Condition()
{
		return TRUE;
};
FUNC VOID DIA_MiltenOW_Hello_Info()
{	
	AI_Output	(self ,other,"DIA_MiltenOW_Hello_03_00");//Podívejme, kdo se vrátil! Náš hrdina od bariéry!
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Rád tê vidím, Miltene.",DIA_MiltenOW_Hello_YES);
	Info_AddChoice (DIA_MiltenOW_Hello,"Mêl bych tê znát?",DIA_MiltenOW_Hello_NO);
};
	// ------------------------------------
	func void B_Milten_GornDiegoLester()
	{
		AI_Output 	(self ,other,"DIA_MiltenOW_Hello_NO_03_02"); //Vzpomínáš si na Gorna, Diega a Lestera?
	};
	// ------------------------------------

FUNC VOID DIA_MiltenOW_Hello_YES()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_YES_15_00");//Rád tê vidím, Miltene. Poâád chvíli tady a chvíli tam?
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_01");//Poâád. Co padla bariéra, vstoupil jsem do kláštera ohnivých mágù.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_02");//Ale jakmile se ukázalo, že sem chtêjí pâijít paladinové, pâišly k duhu moje zkušenosti a znalost okolí.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_03");//Rozhodli se tedy, že mê povêâí svatým posláním poskytnout této výpravê magickou podporu.
	B_Milten_GornDiegoLester();
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Samozâejmê, že si na chlapy pamatuju.",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice (DIA_MiltenOW_Hello,"Ta jména mi vážnê nic neâíkají.",DIA_MiltenOW_Hello_Forget);
};
FUNC VOID DIA_MiltenOW_Hello_NO()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_NO_15_00");//Mêl bych je znát?
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_NO_03_01");//Asi toho máš za sebou dost, co?
	B_Milten_GornDiegoLester();
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Tak co bys rád nahlásil?",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice (DIA_MiltenOW_Hello,"Ta jména mi vážnê nic neâíkají.",DIA_MiltenOW_Hello_Forget);
};
FUNC VOID DIA_MiltenOW_Hello_Friends()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_Friends_15_00");//Samozâejmê že si kluky pamatuju.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_01");//No, Gorn a Diego se daleko nedostali. Sebrali je paladinové tady v údolí.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_02");//Ale Lester zmizel - vùbec netuším, kde by se tak mohl flákat.
	
	if (Npc_KnowsInfo (other, DIA_Lester_Hello)) 
	{
		AI_Output	(other,self ,"DIA_MiltenOW_Hello_Friends_15_03");//S Lesterem jsem se setkal - je teë s Xardasem.
		AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_04");//Aspoà jedna dobrá zpráva.
	};
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_05");//No, já žádné dobré zprávy nemám.
	
	Knows_Diego = TRUE;
	Info_ClearChoices (DIA_MiltenOW_Hello);
};
FUNC VOID DIA_MiltenOW_Hello_Forget()
{
	AI_Output (other,self ,"DIA_MiltenOW_Hello_Forget_15_00");//Ta jména mi vážnê nic neâíkají.
	AI_Output (self ,other,"DIA_MiltenOW_Hello_Forget_03_01");//Hodnê jsi toho zapomnêl, co? No, nechme minulost odpoèívat v pokoji a vênujme se tomu, co máme pâed sebou.
	AI_Output (self ,other,"DIA_MiltenOW_Hello_Forget_03_02");//I když nemám nic pâíjemného, co bych mohl nahlásit.
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
};
// ************************************************************
// 		Bericht	  				  
// ************************************************************
INSTANCE DIA_MiltenOW_Bericht(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 3;
	condition	= DIA_MiltenOW_Bericht_Condition;
	information	= DIA_MiltenOW_Bericht_Info;
	permanent	= FALSE;
	description = "A co bys rád nahlásil?";
};                       

FUNC INT DIA_MiltenOW_Bericht_Condition()
{	
	if Npc_KnowsInfo (other,DIA_MiltenOW_Hello)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Bericht_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Bericht_15_00");//A co bys rád nahlásil?
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_01");//Pâišli sem paladinové a chtêjí odvézt magickou rudu.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_02");//Ale když si vezmu všechny ty draky a skâety, netuším, jak chtêjí paladinové rudu dostat a pak se taky dostat pryè.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_03");//Ne, u Innose - cítím pâítomnost nêèeho temného... roste tu nêjaké zlo. Vychází to z tohohle údolí.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_04");//Za zlikvidování Spáèe jsme zaplatili vysokou cenu. Pád bariéry poznamenal i tohle místo.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_05");//Budeme mít opravdu velké štêstí, když to pâežijeme.
};
// ************************************************************
// 		Erz		  
// ************************************************************
INSTANCE DIA_MiltenOW_Erz(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 4;
	condition	= DIA_MiltenOW_Erz_Condition;
	information	= DIA_MiltenOW_Erz_Info;
	permanent	= FALSE;
	description = "Kolik rudy jste zatím nashromáždili?";
};                       

FUNC INT DIA_MiltenOW_Erz_Condition()
{	
	if Npc_KnowsInfo (other,DIA_MiltenOW_Bericht)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Erz_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Erz_15_00");//Kolik rudy jste zatím nashromáždili?
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_01");//Kolik rudy...? Ani jedinou bednu! Už pâed nêjakou dobou jsme ztratili kontakt s kopáèi.
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_02");//Vùbec by mê nepâekvapilo, kdyby byli dávno mrtví. A ke všemu na nás útoèí draci a oblehli nás skâeti!
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_03");//Celá tahle výprava je naprostá katastrofa.
	
};
/*	
	Diesen Blick kenne ich, den hattest Du auch kurz bevor Du in den Schläfertempel gegangen bist.
*/
// ************************************************************
// 		Wo sind Gorn und Diego?	  				  
// ************************************************************
INSTANCE DIA_MiltenOW_Wo(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Wo_Condition;
	information	= DIA_MiltenOW_Wo_Info;
	permanent	= FALSE;
	description = "Kde jsou teë Gorn a Diego?";
};                       

FUNC INT DIA_MiltenOW_Wo_Condition()
{	
	if Npc_KnowsInfo (other,DIA_MiltenOW_Hello)
	&& (Knows_Diego == TRUE)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Wo_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Wo_Forget_15_00");//Kde jsou teë Gorn a Diego?
	AI_Output (self ,other,"DIA_MiltenOW_Wo_Forget_03_01");//Inu, Gorn sedí tady v žaláâi - bránil se zatèení.
	AI_Output (self ,other,"DIA_MiltenOW_Wo_Forget_03_02");//Diega pâiâadili ke skupinê kopáèù - když tak se zeptej paladina Parcivala, ten dával ty skupiny dohromady.
	
	KnowsAboutGorn = TRUE; 
	SearchForDiego = LOG_RUNNING; 
};
// ************************************************************
// 		Gorn befreien			  
// ************************************************************
INSTANCE DIA_MiltenOW_Gorn(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Gorn_Condition;
	information	= DIA_MiltenOW_Gorn_Info;
	permanent	= FALSE;
	description = "Pojëme osvobodit Gorna!";
};                       

FUNC INT DIA_MiltenOW_Gorn_Condition()
{	
	if (KnowsAboutGorn == TRUE)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Gorn_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Gorn_15_00");//Pojëme osvobodit Gorna!
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_01");//No, je tady jeden malý problém - Gorn je usvêdèený vêzeà.
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_02");//Ale když budeme mít štêstí, podaâí se nám domluvit se s Garondem a vykoupit ho.
	AI_Output (other,self ,"DIA_MiltenOW_Gorn_15_03");//Ano, možná...
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_04");//Udržuj mê v obraze.
	
	Log_CreateTopic (TOPIC_RescueGorn,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_RescueGorn,LOG_RUNNING);
	B_LogEntry (TOPIC_RescueGorn,"Velitel Garond nechal Gorna zavâít. Mêli bychom mu pomoci.");
};
// ************************************************************
// 		Garond will tausend Goldstücke			  
// ************************************************************
INSTANCE DIA_MiltenOW_Preis(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Preis_Condition;
	information	= DIA_MiltenOW_Preis_Info;
	permanent	= FALSE;
	description = "Garond chce za propuštêní Gorna 1000 zlatých.";
};                       

FUNC INT DIA_MiltenOW_Preis_Condition()
{	
	if (MIS_RescueGorn == LOG_RUNNING)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Preis_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Preis_15_00");//Garond chce za Gorna 1000 zlatých.
	AI_Output (self ,other,"DIA_MiltenOW_Preis_03_01");//Hezká sumièka. Mùžu pâispêt 250 zlatými.
	
	B_GiveInvItems (self, other, Itmi_gold, 250);
	B_LogEntry (TOPIC_RescueGorn,"Milten mi dal 250 zlaãákù, abych zaplatil za Gornovo propuštêní.");

};
// ************************************************************
// 		Nicht genug Gold  
// ************************************************************
INSTANCE DIA_MiltenOW_Mehr(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Mehr_Condition;
	information	= DIA_MiltenOW_Mehr_Info;
	permanent	= FALSE;
	description = "Pokud mám Gorna vykoupit, budu potâebovat víc zlata. ";
};                       

FUNC INT DIA_MiltenOW_Mehr_Condition()
{	
	if (MIS_RescueGorn == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Npc_HasItems (other, ItMi_Gold) < 1000) 
	&& Npc_KnowsInfo (other, DIA_MiltenOW_Preis) 
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Mehr_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Mehr_15_00");//Pokud mám Gorna vykoupit, budu potâebovat víc zlata.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_01");//Víc zlata... hm. Diego o takových vêcech ví dost - ale ten tady není.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_02");//Možná si Gorn sám schoval nêjaké zlato na horší èasy - mêli bychom se na to podívat.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_03");//Napíšu mu vzkaz. Zkus mu ho nêjak propašovat do žaláâe.
	
	B_GiveInvItems(self,other,ItWr_LetterForGorn_MIS,1);	 
	B_LogEntry (TOPIC_RescueGorn,"Milten mi pâedal zprávu pro Gorna. Když mu ji nêjak propašuji do vêzení, mùže nám prozradit, jestli nemá nêkde ulité nêjaké zlato.");
};
// ************************************************************
// 		Ausrüstung				  
// ************************************************************
INSTANCE DIA_MiltenOW_Equipment(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Equipment_Condition;
	information	= DIA_MiltenOW_Equipment_Info;
	permanent	= FALSE;
	description = "Mùžeš mi dát nêjaké vybavení?";
};                       

FUNC INT DIA_MiltenOW_Equipment_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Garond_Equipment)
	&& (other.guild == GIL_KDF)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Equipment_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Equipmentt_15_00");//Mohl bys mi dát nêjakou výbavu? Garond mê požádal, jestli bych se nevypravil do dolù.
	AI_Output (self ,other,"DIA_MiltenOW_Equipment_03_01");//A kde bych to tak asi mêl sehnat? Jediné, co ti mùžu dát, je cenný runový kámen.
	//AI_Output (self ,other,"DIA_MiltenOW_Equipmentt_03_02");//Hier stehen zwar noch ein paar Truhen rum, aber ich kann die Schlösser nicht öffnen.  
	
	B_GiveInvItems (self,other, ItMI_RuneBlank,1);
	//Schlüssel auf FP inserten
};	

//***********************
//	Gorns Versteck
//***********************

INSTANCE DIA_MiltenOW_Versteck (C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 1;
	condition	= DIA_MiltenOW_Versteck_Condition;
	information	= DIA_MiltenOW_Versteck_Info;
	permanent	= FALSE;
	IMPORTANT 	= FALSE;
	description = "Nesu odpovêë od Gorna..."; 
}; 

FUNC INT DIA_MiltenOW_Versteck_Condition()
{
	if (GornsTreasure == TRUE)
	&& (Npc_HasItems (other, ItMi_GornsTreasure_MIS ) <= 0)
	&& (Gorns_Beutel == FALSE)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_MiltenOW_Versteck_Info()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Versteck_15_00"); //Mám odpovêë od Gorna. Âíká, že zlato je u jižní brány.
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_01"); //(trpce) Chtêl jsi âíct u bývalé jižní brány. Ten drak z ní udêlal hromadu suti.
	AI_Output	(other,self ,"DIA_MiltenOW_Versteck_15_02"); //Jak se tam dostanu?
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_03"); //Je to poblíž skâetího beranidla. Jižní brána byla napravo od nêj.
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_04"); //Nebude to nijak snadné - buë opatrný a pospêš si.
	
	B_LogEntry (TOPIC_RescueGorn,"Bývalá jižní brána leží pâímo naproti skâetím zátarasùm. Gornovo zlato by mêlo být nêkde tam.");
};
// ************************************************************
// 		Gorn ist frei		  
// ************************************************************
INSTANCE DIA_MiltenOW_Frei(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Frei_Condition;
	information	= DIA_MiltenOW_Frei_Info;
	permanent	= FALSE;
	description = "Osvobodil jsem Gorna.";
};                       

FUNC INT DIA_MiltenOW_Frei_Condition()
{	
	if (MIS_RescueGorn == LOG_SUCCESS)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Frei_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Frei_15_00");//Osvobodil jsem Gorna.
	AI_Output (self ,other,"DIA_MiltenOW_Frei_03_01");//Dobâe. Mêli bychom si promyslet, co bude dál.
};
// ************************************************************
// 		Lehren
// ************************************************************
INSTANCE DIA_MiltenOW_Lehren(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 9;
	condition	= DIA_MiltenOW_Lehren_Condition;
	information	= DIA_MiltenOW_Lehren_Info;
	permanent	= FALSE;
	description = "Mùžeš mê nêèemu nauèit?";
};                       

FUNC INT DIA_MiltenOW_Lehren_Condition()
{	
	if (other.guild == GIL_KDF)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Lehren_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Lehren_15_00");//Mùžeš mê nêèemu nauèit?
	AI_Output (self ,other,"DIA_MiltenOW_Lehren_03_01");//Mohu tê nauèit trochu magie z druhého magického kruhu, pâípadnê ti také mohu pomoci zvýšit magické síly.
	AI_Output (self ,other,"DIA_MiltenOW_Lehren_03_02");//Jestli jsi pâipravený na zvýšení magické síly, mohu tê zaèít uèit.
};	

// ************************************************************
// 		Teach zweiter Kreis
// ************************************************************
INSTANCE DIA_MiltenOW_TeachCircle2(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 91;
	condition	= DIA_MiltenOW_TeachCircle2_Condition;
	information	= DIA_MiltenOW_TeachCircle2_Info;
	permanent	= TRUE;
	description = "Nauè mê druhý magický kruh!";
};                       

FUNC INT DIA_MiltenOW_TeachCircle2_Condition()
{	
	if (other.guild == GIL_KDF)
	&& (Npc_KnowsInfo (other,DIA_MiltenOW_Lehren))
	&& (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) < 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_TeachCircle2_Info()
{	
	AI_Output (other, self, "DIA_Milten_Add_15_00"); //Nauè mê druhý magický kruh!
	AI_Output (self, other, "DIA_Milten_Add_03_01"); //Vêtšinou to je privilegium vyhrazené uèitelùm našeho âádu.
	AI_Output (self, other, "DIA_Milten_Add_03_02"); //Ale myslím, že v tomto pâípadê mùžeme udêlat výjimku.
	
	if (B_TeachMagicCircle (self, other, 2))
	{
		AI_Output (self, other, "DIA_Milten_Add_03_03"); //Nevím, jestli si pamatuju ta oficiální slova správnê...
		AI_Output (self, other, "DIA_Milten_Add_03_04"); //Vstup nyní do druhého kruhu. Ehm... Ukáže ti smêr - cestu však budou tvoâit skutky tvé - nebo tak nêjak to bylo...
		AI_Output (self, other, "DIA_Milten_Add_03_05"); //Myslím, že víš, co to má znamenat...
	};
};


// ************************************************************
// 		Teach
// ************************************************************
INSTANCE DIA_MiltenOW_Teach(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 90;
	condition	= DIA_MiltenOW_Teach_Condition;
	information	= DIA_MiltenOW_Teach_Info;
	permanent	= TRUE;
	description = "Chci se nauèit nêjaká nová kouzla.";
};                       

FUNC INT DIA_MiltenOW_Teach_Condition()
{	
	if (other.guild == GIL_KDF)
	&& Npc_KnowsInfo (other,DIA_MiltenOW_Lehren)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Teach_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Teach_15_00");//Chci se nauèit nêjaká nová kouzla.
	
	if  (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices (DIA_MiltenOW_Teach);
		Info_AddChoice (DIA_MiltenOW_Teach,DIALOG_BACK,DIA_MiltenOW_Teach_BACK);
		
		if (PLAYER_TALENT_RUNES [SPL_WINDFIST] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenOW_Teach, B_BuildLearnString (NAME_SPL_WINDFIST, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_WINDFIST)) ,DIA_MiltenOW_Teach_Windfist);
		};
		if (PLAYER_TALENT_RUNES [SPL_InstantFireball] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenOW_Teach, B_BuildLearnString (NAME_SPL_InstantFireball, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_InstantFireball)) ,DIA_MiltenOW_Teach_Feuerball);
		};
		if (PLAYER_TALENT_RUNES [SPL_Icebolt] == FALSE) 
		{
			Info_AddChoice	(DIA_MiltenOW_Teach, B_BuildLearnString (NAME_SPL_Icebolt, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Icebolt)) ,DIA_MiltenOW_Teach_Eispfeil);
		};
	}
	else
	{
		AI_Output (self ,other,"DIA_MiltenOW_Teach_03_01");//Ještê jsi nevstoupil do druhého magického kruhu. Nemùžu tê nic nauèit.
	};
};	
FUNC VOID DIA_MiltenOW_Teach_BACK()
{
	Info_ClearChoices (DIA_MiltenOW_Teach);
};
FUNC VOID DIA_MiltenOW_Teach_WINDFIST()
{
	B_TeachPlayerTalentRunes (self, other, SPL_WINDFIST);	
};
FUNC VOID DIA_MiltenOW_Teach_Feuerball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_InstantFireball);	
};
FUNC VOID DIA_MiltenOW_Teach_Eispfeil()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Icebolt);	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenOW_Mana		(C_INFO)
{
	npc		  	 = 	PC_Mage_OW;
	nr			 = 	100;
	condition	 = 	DIA_MiltenOW_Mana_Condition;
	information	 = 	DIA_MiltenOW_Mana_Info;
	permanent	 = 	TRUE;
	description	 = 	"Chtêl bych posílit svoji magickou moc.";
};
func int DIA_MiltenOW_Mana_Condition ()
{	
	if (other.guild == GIL_KDF)
	&& Npc_KnowsInfo (other,DIA_MiltenOW_Lehren)
	&& (Kapitel == 2)
	{
		return TRUE;
	};
};
func void DIA_MiltenOW_Mana_Info ()
{
	AI_Output (other, self, "DIA_MiltenOW_Mana_15_00"); //Chtêl bych posílit svoji magickou moc.
	
	Info_ClearChoices   (DIA_MiltenOW_Mana);
	Info_AddChoice 		(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenOW_Mana_1);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenOW_Mana_5);
	
};
func void DIA_MiltenOW_Mana_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output (self, other, "DIA_MiltenOW_Mana_03_00"); //Tvá magická síla je veliká. Pâíliš velká na to, abych ti ji mohl pomoci ještê zvýšit.
	};
	Info_ClearChoices (DIA_MiltenOW_Mana);
};
func void DIA_MiltenOW_Mana_1()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 1, T_MED);
	
	Info_ClearChoices   (DIA_MiltenOW_Mana);
	
	Info_AddChoice 		(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenOW_Mana_1);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenOW_Mana_5);
	
	
};
func void DIA_MiltenOW_Mana_5()
{
	B_TeachAttributePoints (self, other, ATR_MANA_MAX, 5, T_MED);
	
	Info_ClearChoices   (DIA_MiltenOW_Mana);
	
	Info_AddChoice 		(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenOW_Mana_1);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenOW_Mana_5);
	
};
// ************************************************************
// 		Perm
// ************************************************************
INSTANCE DIA_MiltenOW_Perm(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 101;
	condition	= DIA_MiltenOW_Perm_Condition;
	information	= DIA_MiltenOW_Perm_Info;
	permanent	= TRUE;
	description = "Jakou práci tu vykonáváš?";
};                       
FUNC INT DIA_MiltenOW_Perm_Condition()
{	
	if (Kapitel == 2)
	&& (Npc_KnowsInfo (other, DIA_MiltenOW_Frei) == FALSE)
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Perm_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Perm_15_00");//Co tady máš za úkol?
	AI_Output (self ,other,"DIA_MiltenOW_Perm_03_01");//Pùvodnê jsem mêl provádêt rozbor magické rudy. Zatím jsme jí ale moc nedostali.
	AI_Output (self ,other,"DIA_MiltenOW_Perm_03_02");//Teë se soustâeëuji na studium alchymie.
};
// ************************************************************
// 		Perm 2
// ************************************************************
INSTANCE DIA_MiltenOW_Plan(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 101;
	condition	= DIA_MiltenOW_Plan_Condition;
	information	= DIA_MiltenOW_Plan_Info;
	permanent	= TRUE;
	description = "Co máš v plánu?";
};                       
FUNC INT DIA_MiltenOW_Plan_Condition()
{	
	if (Kapitel == 2)
	&& Npc_KnowsInfo (other, DIA_MiltenOW_Frei) 
	{
		return TRUE;
	};
}; 
FUNC VOID DIA_MiltenOW_Plan_Info()
{	
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_00");//Co máš v plánu?
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_01");//Vrátím se. Chvíli ještê poèkám, ale teë, když je Gorn na svobodê, mùžu vyrazit spoleènê s ním.
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_02");//Je naprosto nezbytné, aby se Pyrokar dozvêdêl, jak to tady vypadá.
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_03");//Když myslíš.
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_04");//Doufám, že lord Hagen rozpozná, co za hrozbu vychází z tohoto údolí. Lepší si nepâedstavovat, co by se stalo, kdyby skâeti pâešli pâes prùsmyk.
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_05");//No, v tom pâípadê ti pâeju bezpeènou cestu.
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_MiltenOW_PICKPOCKET (C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 888;
	condition	= DIA_MiltenOW_PICKPOCKET_Condition;
	information	= DIA_MiltenOW_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Ukrást tenhle lektvar bude dosti obtížné.)";
};                       

FUNC INT DIA_MiltenOW_PICKPOCKET_Condition()
{
	if (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == TRUE)
	&& (other.attribute[ATR_DEXTERITY] >= (80 - TheftDiff))
	{
		return 1;
	};
};
FUNC VOID DIA_MiltenOW_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_MiltenOW_PICKPOCKET);
	Info_AddChoice		(DIA_MiltenOW_PICKPOCKET, DIALOG_BACK 		,DIA_MiltenOW_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_MiltenOW_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_MiltenOW_PICKPOCKET_DoIt);
};

func void DIA_MiltenOW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 80)
	{
		CreateInvItems (self,ItPo_Perm_Mana,1);
		B_GiveInvItems (self, other, ItPo_Perm_Mana, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();	
		Info_ClearChoices (DIA_MiltenOW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_MiltenOW_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_MiltenOW_PICKPOCKET);
};



