


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
	AI_Output	(self ,other,"DIA_MiltenOW_Hello_03_00");//PodÌvejme, kdo se vr·til! N·ö hrdina od bariÈry!
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"R·d tÏ vidÌm, Miltene.",DIA_MiltenOW_Hello_YES);
	Info_AddChoice (DIA_MiltenOW_Hello,"MÏl bych tÏ zn·t?",DIA_MiltenOW_Hello_NO);
};
	// ------------------------------------
	func void B_Milten_GornDiegoLester()
	{
		AI_Output 	(self ,other,"DIA_MiltenOW_Hello_NO_03_02"); //VzpomÌn·ö si na Gorna, Diega a Lestera?
	};
	// ------------------------------------

FUNC VOID DIA_MiltenOW_Hello_YES()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_YES_15_00");//R·d tÏ vidÌm, Miltene. Po¯·d chvÌli tady a chvÌli tam?
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_01");//Po¯·d. Co padla bariÈra, vstoupil jsem do kl·ötera ohniv˝ch m·g˘.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_02");//Ale jakmile se uk·zalo, ûe sem chtÏjÌ p¯ijÌt paladinovÈ, p¯iöly k duhu moje zkuöenosti a znalost okolÌ.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_03");//Rozhodli se tedy, ûe mÏ povÏ¯Ì svat˝m posl·nÌm poskytnout tÈto v˝pravÏ magickou podporu.
	B_Milten_GornDiegoLester();
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Samoz¯ejmÏ, ûe si na chlapy pamatuju.",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice (DIA_MiltenOW_Hello,"Ta jmÈna mi v·ûnÏ nic ne¯ÌkajÌ.",DIA_MiltenOW_Hello_Forget);
};
FUNC VOID DIA_MiltenOW_Hello_NO()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_NO_15_00");//MÏl bych je zn·t?
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_NO_03_01");//Asi toho m·ö za sebou dost, co?
	B_Milten_GornDiegoLester();
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Tak co bys r·d nahl·sil?",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice (DIA_MiltenOW_Hello,"Ta jmÈna mi v·ûnÏ nic ne¯ÌkajÌ.",DIA_MiltenOW_Hello_Forget);
};
FUNC VOID DIA_MiltenOW_Hello_Friends()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_Friends_15_00");//Samoz¯ejmÏ ûe si kluky pamatuju.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_01");//No, Gorn a Diego se daleko nedostali. Sebrali je paladinovÈ tady v ˙dolÌ.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_02");//Ale Lester zmizel - v˘bec netuöÌm, kde by se tak mohl fl·kat.
	
	if (Npc_KnowsInfo (other, DIA_Lester_Hello)) 
	{
		AI_Output	(other,self ,"DIA_MiltenOW_Hello_Friends_15_03");//S Lesterem jsem se setkal - je teÔ s Xardasem.
		AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_04");//AspoÚ jedna dobr· zpr·va.
	};
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_05");//No, j· û·dnÈ dobrÈ zpr·vy nem·m.
	
	Knows_Diego = TRUE;
	Info_ClearChoices (DIA_MiltenOW_Hello);
};
FUNC VOID DIA_MiltenOW_Hello_Forget()
{
	AI_Output (other,self ,"DIA_MiltenOW_Hello_Forget_15_00");//Ta jmÈna mi v·ûnÏ nic ne¯ÌkajÌ.
	AI_Output (self ,other,"DIA_MiltenOW_Hello_Forget_03_01");//HodnÏ jsi toho zapomnÏl, co? No, nechme minulost odpoËÌvat v pokoji a vÏnujme se tomu, co m·me p¯ed sebou.
	AI_Output (self ,other,"DIA_MiltenOW_Hello_Forget_03_02");//I kdyû nem·m nic p¯ÌjemnÈho, co bych mohl nahl·sit.
	
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
	description = "A co bys r·d nahl·sil?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Bericht_15_00");//A co bys r·d nahl·sil?
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_01");//P¯iöli sem paladinovÈ a chtÏjÌ odvÈzt magickou rudu.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_02");//Ale kdyû si vezmu vöechny ty draky a sk¯ety, netuöÌm, jak chtÏjÌ paladinovÈ rudu dostat a pak se taky dostat pryË.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_03");//Ne, u Innose - cÌtÌm p¯Ìtomnost nÏËeho temnÈho... roste tu nÏjakÈ zlo. Vych·zÌ to z tohohle ˙dolÌ.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_04");//Za zlikvidov·nÌ Sp·Ëe jsme zaplatili vysokou cenu. P·d bariÈry poznamenal i tohle mÌsto.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_05");//Budeme mÌt opravdu velkÈ ötÏstÌ, kdyû to p¯eûijeme.
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
	description = "Kolik rudy jste zatÌm nashrom·ûdili?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Erz_15_00");//Kolik rudy jste zatÌm nashrom·ûdili?
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_01");//Kolik rudy...? Ani jedinou bednu! Uû p¯ed nÏjakou dobou jsme ztratili kontakt s kop·Ëi.
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_02");//V˘bec by mÏ nep¯ekvapilo, kdyby byli d·vno mrtvÌ. A ke vöemu na n·s ˙toËÌ draci a oblehli n·s sk¯eti!
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_03");//Cel· tahle v˝prava je naprost· katastrofa.
	
};
/*	
	Diesen Blick kenne ich, den hattest Du auch kurz bevor Du in den Schl‰fertempel gegangen bist.
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
	description = "Kde jsou teÔ Gorn a Diego?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Wo_Forget_15_00");//Kde jsou teÔ Gorn a Diego?
	AI_Output (self ,other,"DIA_MiltenOW_Wo_Forget_03_01");//Inu, Gorn sedÌ tady v ûal·¯i - br·nil se zatËenÌ.
	AI_Output (self ,other,"DIA_MiltenOW_Wo_Forget_03_02");//Diega p¯i¯adili ke skupinÏ kop·Ë˘ - kdyû tak se zeptej paladina Parcivala, ten d·val ty skupiny dohromady.
	
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
	description = "PojÔme osvobodit Gorna!";
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
	AI_Output (other,self ,"DIA_MiltenOW_Gorn_15_00");//PojÔme osvobodit Gorna!
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_01");//No, je tady jeden mal˝ problÈm - Gorn je usvÏdËen˝ vÏzeÚ.
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_02");//Ale kdyû budeme mÌt ötÏstÌ, poda¯Ì se n·m domluvit se s Garondem a vykoupit ho.
	AI_Output (other,self ,"DIA_MiltenOW_Gorn_15_03");//Ano, moûn·...
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_04");//Udrûuj mÏ v obraze.
	
	Log_CreateTopic (TOPIC_RescueGorn,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_RescueGorn,LOG_RUNNING);
	B_LogEntry (TOPIC_RescueGorn,"Velitel Garond nechal Gorna zav¯Ìt. MÏli bychom mu pomoci.");
};
// ************************************************************
// 		Garond will tausend Goldst¸cke			  
// ************************************************************
INSTANCE DIA_MiltenOW_Preis(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Preis_Condition;
	information	= DIA_MiltenOW_Preis_Info;
	permanent	= FALSE;
	description = "Garond chce za propuötÏnÌ Gorna 1000 zlat˝ch.";
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
	AI_Output (other,self ,"DIA_MiltenOW_Preis_15_00");//Garond chce za Gorna 1000 zlat˝ch.
	AI_Output (self ,other,"DIA_MiltenOW_Preis_03_01");//Hezk· sumiËka. M˘ûu p¯ispÏt 250 zlat˝mi.
	
	B_GiveInvItems (self, other, Itmi_gold, 250);
	B_LogEntry (TOPIC_RescueGorn,"Milten mi dal 250 zlaù·k˘, abych zaplatil za Gornovo propuötÏnÌ.");

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
	description = "Pokud m·m Gorna vykoupit, budu pot¯ebovat vÌc zlata. ";
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
	AI_Output (other,self ,"DIA_MiltenOW_Mehr_15_00");//Pokud m·m Gorna vykoupit, budu pot¯ebovat vÌc zlata.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_01");//VÌc zlata... hm. Diego o takov˝ch vÏcech vÌ dost - ale ten tady nenÌ.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_02");//Moûn· si Gorn s·m schoval nÏjakÈ zlato na horöÌ Ëasy - mÏli bychom se na to podÌvat.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_03");//NapÌöu mu vzkaz. Zkus mu ho nÏjak propaöovat do ûal·¯e.
	
	B_GiveInvItems(self,other,ItWr_LetterForGorn_MIS,1);	 
	B_LogEntry (TOPIC_RescueGorn,"Milten mi p¯edal zpr·vu pro Gorna. Kdyû mu ji nÏjak propaöuji do vÏzenÌ, m˘ûe n·m prozradit, jestli nem· nÏkde ulitÈ nÏjakÈ zlato.");
};
// ************************************************************
// 		Ausr¸stung				  
// ************************************************************
INSTANCE DIA_MiltenOW_Equipment(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Equipment_Condition;
	information	= DIA_MiltenOW_Equipment_Info;
	permanent	= FALSE;
	description = "M˘ûeö mi d·t nÏjakÈ vybavenÌ?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Equipmentt_15_00");//Mohl bys mi d·t nÏjakou v˝bavu? Garond mÏ poû·dal, jestli bych se nevypravil do dol˘.
	AI_Output (self ,other,"DIA_MiltenOW_Equipment_03_01");//A kde bych to tak asi mÏl sehnat? JedinÈ, co ti m˘ûu d·t, je cenn˝ runov˝ k·men.
	//AI_Output (self ,other,"DIA_MiltenOW_Equipmentt_03_02");//Hier stehen zwar noch ein paar Truhen rum, aber ich kann die Schlˆsser nicht ˆffnen.  
	
	B_GiveInvItems (self,other, ItMI_RuneBlank,1);
	//Schl¸ssel auf FP inserten
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
	description = "Nesu odpovÏÔ od Gorna..."; 
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
	AI_Output	(other,self ,"DIA_MiltenOW_Versteck_15_00"); //M·m odpovÏÔ od Gorna. ÿÌk·, ûe zlato je u jiûnÌ br·ny.
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_01"); //(trpce) ChtÏl jsi ¯Ìct u b˝valÈ jiûnÌ br·ny. Ten drak z nÌ udÏlal hromadu suti.
	AI_Output	(other,self ,"DIA_MiltenOW_Versteck_15_02"); //Jak se tam dostanu?
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_03"); //Je to poblÌû sk¯etÌho beranidla. JiûnÌ br·na byla napravo od nÏj.
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_04"); //Nebude to nijak snadnÈ - buÔ opatrn˝ a pospÏö si.
	
	B_LogEntry (TOPIC_RescueGorn,"B˝val· jiûnÌ br·na leûÌ p¯Ìmo naproti sk¯etÌm z·taras˘m. Gornovo zlato by mÏlo b˝t nÏkde tam.");
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
	AI_Output (self ,other,"DIA_MiltenOW_Frei_03_01");//Dob¯e. MÏli bychom si promyslet, co bude d·l.
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
	description = "M˘ûeö mÏ nÏËemu nauËit?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Lehren_15_00");//M˘ûeö mÏ nÏËemu nauËit?
	AI_Output (self ,other,"DIA_MiltenOW_Lehren_03_01");//Mohu tÏ nauËit trochu magie z druhÈho magickÈho kruhu, p¯ÌpadnÏ ti takÈ mohu pomoci zv˝öit magickÈ sÌly.
	AI_Output (self ,other,"DIA_MiltenOW_Lehren_03_02");//Jestli jsi p¯ipraven˝ na zv˝öenÌ magickÈ sÌly, mohu tÏ zaËÌt uËit.
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
	description = "NauË mÏ druh˝ magick˝ kruh!";
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
	AI_Output (other, self, "DIA_Milten_Add_15_00"); //NauË mÏ druh˝ magick˝ kruh!
	AI_Output (self, other, "DIA_Milten_Add_03_01"); //VÏtöinou to je privilegium vyhrazenÈ uËitel˘m naöeho ¯·du.
	AI_Output (self, other, "DIA_Milten_Add_03_02"); //Ale myslÌm, ûe v tomto p¯ÌpadÏ m˘ûeme udÏlat v˝jimku.
	
	if (B_TeachMagicCircle (self, other, 2))
	{
		AI_Output (self, other, "DIA_Milten_Add_03_03"); //NevÌm, jestli si pamatuju ta ofici·lnÌ slova spr·vnÏ...
		AI_Output (self, other, "DIA_Milten_Add_03_04"); //Vstup nynÌ do druhÈho kruhu. Ehm... Uk·ûe ti smÏr - cestu vöak budou tvo¯it skutky tvÈ - nebo tak nÏjak to bylo...
		AI_Output (self, other, "DIA_Milten_Add_03_05"); //MyslÌm, ûe vÌö, co to m· znamenat...
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
	description = "Chci se nauËit nÏjak· nov· kouzla.";
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
	AI_Output (other,self ,"DIA_MiltenOW_Teach_15_00");//Chci se nauËit nÏjak· nov· kouzla.
	
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
		AI_Output (self ,other,"DIA_MiltenOW_Teach_03_01");//JeötÏ jsi nevstoupil do druhÈho magickÈho kruhu. Nem˘ûu tÏ nic nauËit.
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
	description	 = 	"ChtÏl bych posÌlit svoji magickou moc.";
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
	AI_Output (other, self, "DIA_MiltenOW_Mana_15_00"); //ChtÏl bych posÌlit svoji magickou moc.
	
	Info_ClearChoices   (DIA_MiltenOW_Mana);
	Info_AddChoice 		(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenOW_Mana_1);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenOW_Mana_5);
	
};
func void DIA_MiltenOW_Mana_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output (self, other, "DIA_MiltenOW_Mana_03_00"); //Tv· magick· sÌla je velik·. P¯Ìliö velk· na to, abych ti ji mohl pomoci jeötÏ zv˝öit.
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
	description = "Jakou pr·ci tu vykon·v·ö?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Perm_15_00");//Co tady m·ö za ˙kol?
	AI_Output (self ,other,"DIA_MiltenOW_Perm_03_01");//P˘vodnÏ jsem mÏl prov·dÏt rozbor magickÈ rudy. ZatÌm jsme jÌ ale moc nedostali.
	AI_Output (self ,other,"DIA_MiltenOW_Perm_03_02");//TeÔ se soust¯eÔuji na studium alchymie.
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
	description = "Co m·ö v pl·nu?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_00");//Co m·ö v pl·nu?
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_01");//Vr·tÌm se. ChvÌli jeötÏ poËk·m, ale teÔ, kdyû je Gorn na svobodÏ, m˘ûu vyrazit spoleËnÏ s nÌm.
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_02");//Je naprosto nezbytnÈ, aby se Pyrokar dozvÏdÏl, jak to tady vypad·.
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_03");//Kdyû myslÌö.
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_04");//Douf·m, ûe lord Hagen rozpozn·, co za hrozbu vych·zÌ z tohoto ˙dolÌ. LepöÌ si nep¯edstavovat, co by se stalo, kdyby sk¯eti p¯eöli p¯es pr˘smyk.
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_05");//No, v tom p¯ÌpadÏ ti p¯eju bezpeËnou cestu.
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
	description = "(Ukr·st tenhle lektvar bude dosti obtÌûnÈ.)";
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



