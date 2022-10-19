


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
	AI_Output	(self ,other,"DIA_MiltenOW_Hello_03_00");//Pod�vejme, kdo se vr�til! N� hrdina od bari�ry!
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"R�d t� vid�m, Miltene.",DIA_MiltenOW_Hello_YES);
	Info_AddChoice (DIA_MiltenOW_Hello,"M�l bych t� zn�t?",DIA_MiltenOW_Hello_NO);
};
	// ------------------------------------
	func void B_Milten_GornDiegoLester()
	{
		AI_Output 	(self ,other,"DIA_MiltenOW_Hello_NO_03_02"); //Vzpom�n� si na Gorna, Diega a Lestera?
	};
	// ------------------------------------

FUNC VOID DIA_MiltenOW_Hello_YES()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_YES_15_00");//R�d t� vid�m, Miltene. Po��d chv�li tady a chv�li tam?
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_01");//Po��d. Co padla bari�ra, vstoupil jsem do kl�tera ohniv�ch m�g�.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_02");//Ale jakmile se uk�zalo, �e sem cht�j� p�ij�t paladinov�, p�i�ly k duhu moje zku�enosti a znalost okol�.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_03");//Rozhodli se tedy, �e m� pov��� svat�m posl�n�m poskytnout t�to v�prav� magickou podporu.
	B_Milten_GornDiegoLester();
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Samoz�ejm�, �e si na chlapy pamatuju.",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice (DIA_MiltenOW_Hello,"Ta jm�na mi v�n� nic ne��kaj�.",DIA_MiltenOW_Hello_Forget);
};
FUNC VOID DIA_MiltenOW_Hello_NO()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_NO_15_00");//M�l bych je zn�t?
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_NO_03_01");//Asi toho m� za sebou dost, co?
	B_Milten_GornDiegoLester();
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Tak co bys r�d nahl�sil?",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice (DIA_MiltenOW_Hello,"Ta jm�na mi v�n� nic ne��kaj�.",DIA_MiltenOW_Hello_Forget);
};
FUNC VOID DIA_MiltenOW_Hello_Friends()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_Friends_15_00");//Samoz�ejm� �e si kluky pamatuju.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_01");//No, Gorn a Diego se daleko nedostali. Sebrali je paladinov� tady v �dol�.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_02");//Ale Lester zmizel - v�bec netu��m, kde by se tak mohl fl�kat.
	
	if (Npc_KnowsInfo (other, DIA_Lester_Hello)) 
	{
		AI_Output	(other,self ,"DIA_MiltenOW_Hello_Friends_15_03");//S Lesterem jsem se setkal - je te� s Xardasem.
		AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_04");//Aspo� jedna dobr� zpr�va.
	};
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_05");//No, j� ��dn� dobr� zpr�vy nem�m.
	
	Knows_Diego = TRUE;
	Info_ClearChoices (DIA_MiltenOW_Hello);
};
FUNC VOID DIA_MiltenOW_Hello_Forget()
{
	AI_Output (other,self ,"DIA_MiltenOW_Hello_Forget_15_00");//Ta jm�na mi v�n� nic ne��kaj�.
	AI_Output (self ,other,"DIA_MiltenOW_Hello_Forget_03_01");//Hodn� jsi toho zapomn�l, co? No, nechme minulost odpo��vat v pokoji a v�nujme se tomu, co m�me p�ed sebou.
	AI_Output (self ,other,"DIA_MiltenOW_Hello_Forget_03_02");//I kdy� nem�m nic p��jemn�ho, co bych mohl nahl�sit.
	
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
	description = "A co bys r�d nahl�sil?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Bericht_15_00");//A co bys r�d nahl�sil?
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_01");//P�i�li sem paladinov� a cht�j� odv�zt magickou rudu.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_02");//Ale kdy� si vezmu v�echny ty draky a sk�ety, netu��m, jak cht�j� paladinov� rudu dostat a pak se taky dostat pry�.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_03");//Ne, u Innose - c�t�m p��tomnost n��eho temn�ho... roste tu n�jak� zlo. Vych�z� to z tohohle �dol�.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_04");//Za zlikvidov�n� Sp��e jsme zaplatili vysokou cenu. P�d bari�ry poznamenal i tohle m�sto.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_05");//Budeme m�t opravdu velk� �t�st�, kdy� to p�e�ijeme.
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
	description = "Kolik rudy jste zat�m nashrom�dili?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Erz_15_00");//Kolik rudy jste zat�m nashrom�dili?
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_01");//Kolik rudy...? Ani jedinou bednu! U� p�ed n�jakou dobou jsme ztratili kontakt s kop��i.
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_02");//V�bec by m� nep�ekvapilo, kdyby byli d�vno mrtv�. A ke v�emu na n�s �to�� draci a oblehli n�s sk�eti!
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_03");//Cel� tahle v�prava je naprost� katastrofa.
	
};
/*	
	Diesen Blick kenne ich, den hattest Du auch kurz bevor Du in den Schl�fertempel gegangen bist.
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
	description = "Kde jsou te� Gorn a Diego?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Wo_Forget_15_00");//Kde jsou te� Gorn a Diego?
	AI_Output (self ,other,"DIA_MiltenOW_Wo_Forget_03_01");//Inu, Gorn sed� tady v �al��i - br�nil se zat�en�.
	AI_Output (self ,other,"DIA_MiltenOW_Wo_Forget_03_02");//Diega p�i�adili ke skupin� kop��� - kdy� tak se zeptej paladina Parcivala, ten d�val ty skupiny dohromady.
	
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
	description = "Poj�me osvobodit Gorna!";
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
	AI_Output (other,self ,"DIA_MiltenOW_Gorn_15_00");//Poj�me osvobodit Gorna!
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_01");//No, je tady jeden mal� probl�m - Gorn je usv�d�en� v�ze�.
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_02");//Ale kdy� budeme m�t �t�st�, poda�� se n�m domluvit se s Garondem a vykoupit ho.
	AI_Output (other,self ,"DIA_MiltenOW_Gorn_15_03");//Ano, mo�n�...
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_04");//Udr�uj m� v obraze.
	
	Log_CreateTopic (TOPIC_RescueGorn,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_RescueGorn,LOG_RUNNING);
	B_LogEntry (TOPIC_RescueGorn,"Velitel Garond nechal Gorna zav��t. M�li bychom mu pomoci.");
};
// ************************************************************
// 		Garond will tausend Goldst�cke			  
// ************************************************************
INSTANCE DIA_MiltenOW_Preis(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Preis_Condition;
	information	= DIA_MiltenOW_Preis_Info;
	permanent	= FALSE;
	description = "Garond chce za propu�t�n� Gorna 1000 zlat�ch.";
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
	AI_Output (other,self ,"DIA_MiltenOW_Preis_15_00");//Garond chce za Gorna 1000 zlat�ch.
	AI_Output (self ,other,"DIA_MiltenOW_Preis_03_01");//Hezk� sumi�ka. M��u p�isp�t 250 zlat�mi.
	
	B_GiveInvItems (self, other, Itmi_gold, 250);
	B_LogEntry (TOPIC_RescueGorn,"Milten mi dal 250 zla��k�, abych zaplatil za Gornovo propu�t�n�.");

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
	description = "Pokud m�m Gorna vykoupit, budu pot�ebovat v�c zlata. ";
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
	AI_Output (other,self ,"DIA_MiltenOW_Mehr_15_00");//Pokud m�m Gorna vykoupit, budu pot�ebovat v�c zlata.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_01");//V�c zlata... hm. Diego o takov�ch v�cech v� dost - ale ten tady nen�.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_02");//Mo�n� si Gorn s�m schoval n�jak� zlato na hor�� �asy - m�li bychom se na to pod�vat.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_03");//Nap�u mu vzkaz. Zkus mu ho n�jak propa�ovat do �al��e.
	
	B_GiveInvItems(self,other,ItWr_LetterForGorn_MIS,1);	 
	B_LogEntry (TOPIC_RescueGorn,"Milten mi p�edal zpr�vu pro Gorna. Kdy� mu ji n�jak propa�uji do v�zen�, m��e n�m prozradit, jestli nem� n�kde ulit� n�jak� zlato.");
};
// ************************************************************
// 		Ausr�stung				  
// ************************************************************
INSTANCE DIA_MiltenOW_Equipment(C_INFO)
{
	npc			= PC_Mage_OW;
	nr			= 5;
	condition	= DIA_MiltenOW_Equipment_Condition;
	information	= DIA_MiltenOW_Equipment_Info;
	permanent	= FALSE;
	description = "M��e� mi d�t n�jak� vybaven�?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Equipmentt_15_00");//Mohl bys mi d�t n�jakou v�bavu? Garond m� po��dal, jestli bych se nevypravil do dol�.
	AI_Output (self ,other,"DIA_MiltenOW_Equipment_03_01");//A kde bych to tak asi m�l sehnat? Jedin�, co ti m��u d�t, je cenn� runov� k�men.
	//AI_Output (self ,other,"DIA_MiltenOW_Equipmentt_03_02");//Hier stehen zwar noch ein paar Truhen rum, aber ich kann die Schl�sser nicht �ffnen.  
	
	B_GiveInvItems (self,other, ItMI_RuneBlank,1);
	//Schl�ssel auf FP inserten
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
	description = "Nesu odpov�� od Gorna..."; 
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
	AI_Output	(other,self ,"DIA_MiltenOW_Versteck_15_00"); //M�m odpov�� od Gorna. ��k�, �e zlato je u ji�n� br�ny.
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_01"); //(trpce) Cht�l jsi ��ct u b�val� ji�n� br�ny. Ten drak z n� ud�lal hromadu suti.
	AI_Output	(other,self ,"DIA_MiltenOW_Versteck_15_02"); //Jak se tam dostanu?
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_03"); //Je to pobl� sk�et�ho beranidla. Ji�n� br�na byla napravo od n�j.
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_04"); //Nebude to nijak snadn� - bu� opatrn� a posp� si.
	
	B_LogEntry (TOPIC_RescueGorn,"B�val� ji�n� br�na le�� p��mo naproti sk�et�m z�taras�m. Gornovo zlato by m�lo b�t n�kde tam.");
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
	AI_Output (self ,other,"DIA_MiltenOW_Frei_03_01");//Dob�e. M�li bychom si promyslet, co bude d�l.
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
	description = "M��e� m� n��emu nau�it?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Lehren_15_00");//M��e� m� n��emu nau�it?
	AI_Output (self ,other,"DIA_MiltenOW_Lehren_03_01");//Mohu t� nau�it trochu magie z druh�ho magick�ho kruhu, p��padn� ti tak� mohu pomoci zv��it magick� s�ly.
	AI_Output (self ,other,"DIA_MiltenOW_Lehren_03_02");//Jestli jsi p�ipraven� na zv��en� magick� s�ly, mohu t� za��t u�it.
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
	description = "Nau� m� druh� magick� kruh!";
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
	AI_Output (other, self, "DIA_Milten_Add_15_00"); //Nau� m� druh� magick� kruh!
	AI_Output (self, other, "DIA_Milten_Add_03_01"); //V�t�inou to je privilegium vyhrazen� u�itel�m na�eho ��du.
	AI_Output (self, other, "DIA_Milten_Add_03_02"); //Ale mysl�m, �e v tomto p��pad� m��eme ud�lat v�jimku.
	
	if (B_TeachMagicCircle (self, other, 2))
	{
		AI_Output (self, other, "DIA_Milten_Add_03_03"); //Nev�m, jestli si pamatuju ta ofici�ln� slova spr�vn�...
		AI_Output (self, other, "DIA_Milten_Add_03_04"); //Vstup nyn� do druh�ho kruhu. Ehm... Uk�e ti sm�r - cestu v�ak budou tvo�it skutky tv� - nebo tak n�jak to bylo...
		AI_Output (self, other, "DIA_Milten_Add_03_05"); //Mysl�m, �e v�, co to m� znamenat...
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
	description = "Chci se nau�it n�jak� nov� kouzla.";
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
	AI_Output (other,self ,"DIA_MiltenOW_Teach_15_00");//Chci se nau�it n�jak� nov� kouzla.
	
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
		AI_Output (self ,other,"DIA_MiltenOW_Teach_03_01");//Je�t� jsi nevstoupil do druh�ho magick�ho kruhu. Nem��u t� nic nau�it.
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
	description	 = 	"Cht�l bych pos�lit svoji magickou moc.";
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
	AI_Output (other, self, "DIA_MiltenOW_Mana_15_00"); //Cht�l bych pos�lit svoji magickou moc.
	
	Info_ClearChoices   (DIA_MiltenOW_Mana);
	Info_AddChoice 		(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenOW_Mana_1);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenOW_Mana_5);
	
};
func void DIA_MiltenOW_Mana_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output (self, other, "DIA_MiltenOW_Mana_03_00"); //Tv� magick� s�la je velik�. P��li� velk� na to, abych ti ji mohl pomoci je�t� zv��it.
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
	description = "Jakou pr�ci tu vykon�v�?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Perm_15_00");//Co tady m� za �kol?
	AI_Output (self ,other,"DIA_MiltenOW_Perm_03_01");//P�vodn� jsem m�l prov�d�t rozbor magick� rudy. Zat�m jsme j� ale moc nedostali.
	AI_Output (self ,other,"DIA_MiltenOW_Perm_03_02");//Te� se soust�e�uji na studium alchymie.
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
	description = "Co m� v pl�nu?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_00");//Co m� v pl�nu?
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_01");//Vr�t�m se. Chv�li je�t� po�k�m, ale te�, kdy� je Gorn na svobod�, m��u vyrazit spole�n� s n�m.
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_02");//Je naprosto nezbytn�, aby se Pyrokar dozv�d�l, jak to tady vypad�.
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_03");//Kdy� mysl�.
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_04");//Douf�m, �e lord Hagen rozpozn�, co za hrozbu vych�z� z tohoto �dol�. Lep�� si nep�edstavovat, co by se stalo, kdyby sk�eti p�e�li p�es pr�smyk.
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_05");//No, v tom p��pad� ti p�eju bezpe�nou cestu.
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
	description = "(Ukr�st tenhle lektvar bude dosti obt�n�.)";
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



