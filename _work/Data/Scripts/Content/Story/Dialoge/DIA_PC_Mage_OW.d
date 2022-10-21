


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
	AI_Output	(self ,other,"DIA_MiltenOW_Hello_03_00");//Kogo ja widz�! To nasz bohater zza Bariery!
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Mi�o ci� znowu widzie�, Miltenie.",DIA_MiltenOW_Hello_YES);
	Info_AddChoice (DIA_MiltenOW_Hello,"A powinienem ich pami�ta�?",DIA_MiltenOW_Hello_NO);
};
	// ------------------------------------
	func void B_Milten_GornDiegoLester()
	{
		AI_Output 	(self ,other,"DIA_MiltenOW_Hello_NO_03_02"); //Pami�tasz jeszcze Gorna, Diega i Lestera?
	};
	// ------------------------------------

FUNC VOID DIA_MiltenOW_Hello_YES()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_YES_15_00");//Mi�o ci� znowu widzie�, Miltenie. A ty - CI�GLE tutaj, czy ZNOWU tutaj?
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_01");//Znowu. Po upadku Bariery wr�ci�em do klasztoru Mag�w Ognia.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_02");//Ale gdy paladyni postanowili zej�� do Doliny, moje do�wiadczenie i znajomo�� terenu okaza�y si� bardzo przydatne.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_03");//Dlatego Najwy�sza Rada wys�a�a mnie tutaj jako magiczne wsparcie dla ca�ej ekspedycji.
	B_Milten_GornDiegoLester();
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Oczywi�cie, �e ich pami�tam!",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice (DIA_MiltenOW_Hello,"Te imiona nic mi nie m�wi�.",DIA_MiltenOW_Hello_Forget);
};
FUNC VOID DIA_MiltenOW_Hello_NO()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_NO_15_00");//A powinienem ich pami�ta�?
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_NO_03_01");//Przeszed�e� przez niez�e piek�o, co?
	B_Milten_GornDiegoLester();
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Jak si� maj� sprawy?",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice (DIA_MiltenOW_Hello,"Te imiona nic mi nie m�wi�.",DIA_MiltenOW_Hello_Forget);
};
FUNC VOID DIA_MiltenOW_Hello_Friends()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_Friends_15_00");//Oczywi�cie, �e ich pami�tam!
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_01");//C�, Gorn i Diego daleko nie zaszli. Zostali schwytani w Dolinie przez paladyn�w.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_02");//Tylko Lesterowi uda�o si� prysn��, chocia� nie wiem, gdzie si� teraz podziewa.
	
	if (Npc_KnowsInfo (other, DIA_Lester_Hello)) 
	{
		AI_Output	(other,self ,"DIA_MiltenOW_Hello_Friends_15_03");//Spotka�em Lestera. Jest u Xardasa.
		AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_04");//Przynajmniej jedna dobra wiadomo��.
	};
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_05");//C�, nie mam dla ciebie �adnych dobrych wie�ci.
	
	Knows_Diego = TRUE;
	Info_ClearChoices (DIA_MiltenOW_Hello);
};
FUNC VOID DIA_MiltenOW_Hello_Forget()
{
	AI_Output (other,self ,"DIA_MiltenOW_Hello_Forget_15_00");//Te imiona nic mi nie m�wi�.
	AI_Output (self ,other,"DIA_MiltenOW_Hello_Forget_03_01");//Wiele zapomnia�e�... Zostawmy zatem przesz�o�� i skoncentrujmy si� na tera�niejszo�ci.
	AI_Output (self ,other,"DIA_MiltenOW_Hello_Forget_03_02");//Mimo �e nie prezentuje si� ona najlepiej.
	
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
	description = "Jak si� maj� sprawy?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Bericht_15_00");//Jak si� maj� sprawy?
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_01");//Paladyni przybyli tutaj, �eby zgromadzi� jak najwi�cej magicznej rudy.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_02");//Ale bior�c pod uwag� smocze ataki i orkow� armi�, �miem w�tpi�, czy im si� to uda.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_03");//Nie, na Innosa. Wyczuwam tu obecno�� czego� mrocznego... czego� bardzo z�ego. Ponura moc wype�nia ca�� Dolin�.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_04");//Cena za zwyci�stwo nad �ni�cym okaza�a si� bardzo wysoka. Upadek Bariery to prawdziwa katastrofa.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_05");//Je�li to przetrwamy, mo�emy m�wi� o prawdziwym szcz�ciu.
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
	description = "Ile rudy zgromadzili�cie do tej pory?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Erz_15_00");//Ile rudy zgromadzili�cie do tej pory?
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_01");//Ile rudy? Ani bry�ki! Od jakiego� czasu nie mamy �adnych wie�ci od g�rnik�w.
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_02");//Nie zdziwi�bym si�, gdyby ju� nie �yli. A na domiar z�ego jeste�my atakowani przez smoki i hord� ork�w!
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_03");//Ta wyprawa to jedno wielkie niepowodzenie!
	
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
	description = "Gdzie s� teraz Gorn i Diego?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Wo_Forget_15_00");//Gdzie s� teraz Gorn i Diego?
	AI_Output (self ,other,"DIA_MiltenOW_Wo_Forget_03_01");//C�. Gorn siedzi w tutejszym lochu za stawianie oporu paladynom.
	AI_Output (self ,other,"DIA_MiltenOW_Wo_Forget_03_02");//Diego zosta� przydzielony do grupy g�rnik�w. Porozmawiaj z paladynem imieniem Parcival. To on dobiera� ludzi.
	
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
	description = "Chod�my uwolni� Gorna!";
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
	AI_Output (other,self ,"DIA_MiltenOW_Gorn_15_00");//Chod�my uwolni� Gorna!
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_01");//To nie takie proste! Gorn jest skaza�cem.
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_02");//Przy odrobinie szcz�cia Garond wyznaczy jak�� grzywn�, po kt�rej zap�aceniu Gorn odzyska wolno��.
	AI_Output (other,self ,"DIA_MiltenOW_Gorn_15_03");//Tak, to mo�liwe...
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_04");//Daj mi zna�, gdyby� si� czego� dowiedzia�.
	
	Log_CreateTopic (TOPIC_RescueGorn,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_RescueGorn,LOG_RUNNING);
	B_LogEntry (TOPIC_RescueGorn,"Kapitan Garond kaza� wsadzi� Gorna do wi�zienia. Mo�e uda nam si� go jako� uwolni�.");
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
	description = "Garond domaga si� 1000 sztuk z�ota za uwolnienie Gorna.";
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
	AI_Output (other,self ,"DIA_MiltenOW_Preis_15_00");//Garond domaga si� 1000 sztuk z�ota za uwolnienie Gorna.
	AI_Output (self ,other,"DIA_MiltenOW_Preis_03_01");//Niez�a sumka. Mog� dorzuci� 250 sztuk z mojej kieszeni.
	
	B_GiveInvItems (self, other, Itmi_gold, 250);
	B_LogEntry (TOPIC_RescueGorn,"Milten da� mi 250 sztuk z�ota, abym zap�aci� za wypuszczenie Gorna z wi�zienia.");

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
	description = "To za ma�o. Musz� jako� zdoby� ca�� reszt�.";
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
	AI_Output (other,self ,"DIA_MiltenOW_Mehr_15_00");//To za ma�o. Musz� jako� zdoby� ca�� reszt�.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_01");//Zdoby� wi�cej z�ota... hmmm. Diego jest w tym specjalist�, ale go tu nie ma...
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_02");//Mo�e sam Gorn od�o�y� gdzie� troch� z�ota? Powinni�my si� tego dowiedzie�.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_03");//Czekaj. Napisz� do niego list. Spr�buj go jako� przemyci� do lochu.
	
	B_GiveInvItems(self,other,ItWr_LetterForGorn_MIS,1);	 
	B_LogEntry (TOPIC_RescueGorn,"Milten da� mi wiadomo�� dla Gorna. Je�li zdo�am j� przemyci� do wi�zienia, mo�e dowiedziemy si�, czy Gorn posiada jakie� zapasy z�ota.");
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
	description = "Masz mo�e dla mnie jakie� wyposa�enie?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Equipmentt_15_00");//Masz mo�e dla mnie jakie� wyposa�enie? Garond kaza� mi odwiedzi� kopalnie.
	AI_Output (self ,other,"DIA_MiltenOW_Equipment_03_01");//Sk�d niby mia�bym je wzi��? Je�li chcesz, mog� ci da� runiczny kamie�.
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
	description = "Mam odpowied� od Gorna..."; 
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
	AI_Output	(other,self ,"DIA_MiltenOW_Versteck_15_00"); //Mam odpowied� od Gorna. Podobno ukry� z�oto gdzie� przy po�udniowej bramie.
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_01"); //DAWNEJ po�udniowej bramie, chcia�e� powiedzie�. Smok obr�ci� j� w zupe�n� ruin�.
	AI_Output	(other,self ,"DIA_MiltenOW_Versteck_15_02"); //Jak si� tam dosta�?
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_03"); //To niedaleko tarana ork�w. Po�udniowa brama by�a na prawo od niego.
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_04"); //To nie b�dzie �atwy spacerek. Uwa�aj na siebie i �piesz si�!
	
	B_LogEntry (TOPIC_RescueGorn,"By�a po�udniowa brama znajduje si� na prawo od orkowego tarana. Gorn ukry� z�oto gdzie� w tej okolicy.");
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
	description = "Uwolni�em Gorna.";
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
	AI_Output (other,self ,"DIA_MiltenOW_Frei_15_00");//Uwolni�em Gorna.
	AI_Output (self ,other,"DIA_MiltenOW_Frei_03_01");//Dobra robota. Zastan�wmy si�, co dalej.
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
	description = "Mo�esz mnie czego� nauczy�?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Lehren_15_00");//Mo�esz mnie czego� nauczy�?
	AI_Output (self ,other,"DIA_MiltenOW_Lehren_03_01");//Mog� nauczy� ci� niekt�rych zakl�� z drugiego kr�gu magii albo zwi�kszy� troch� twoj� magiczn� moc.
	AI_Output (self ,other,"DIA_MiltenOW_Lehren_03_02");//Je�li jeste� got�w zwi�kszy� swoj� magiczn� moc, mog� ci pom�c.
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
	description = "Wprowad� mnie do drugiego kr�gu magii!";
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
	AI_Output (other, self, "DIA_Milten_Add_15_00"); //Wprowad� mnie do drugiego kr�gu magii!
	AI_Output (self, other, "DIA_Milten_Add_03_01"); //W zasadzie powinien si� tym zaj�� kt�ry� z nauczycieli naszego zakonu...
	AI_Output (self, other, "DIA_Milten_Add_03_02"); //...ale w tej sytuacji mo�emy chyba zrobi� wyj�tek.
	
	if (B_TeachMagicCircle (self, other, 2))
	{
		AI_Output (self, other, "DIA_Milten_Add_03_03"); //Nie wiem, czy pami�tam oficjaln� formu�k�...
		AI_Output (self, other, "DIA_Milten_Add_03_04"); //Oto wkraczasz w drugi kr�g magii... Eee... Magia wska�e ci drog�, ale to twoje czyny ci� ni� poprowadz�... Czy co� w tym stylu...
		AI_Output (self, other, "DIA_Milten_Add_03_05"); //Chyba wiesz, o co mi chodzi...
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
	description = "Chc� si� nauczy� nowych zakl��.";
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
	AI_Output (other,self ,"DIA_MiltenOW_Teach_15_00");//Chc� si� nauczy� nowych zakl��.
	
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
		AI_Output (self ,other,"DIA_MiltenOW_Teach_03_01");//Nie pozna�e� jeszcze drugiego kr�gu magii. Nie mog� ci� niczego nauczy�.
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
	description	 = 	"Chc� zwi�kszy� moj� magiczn� moc.";
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
	AI_Output (other, self, "DIA_MiltenOW_Mana_15_00"); //Chc� zwi�kszy� moj� magiczn� moc.
	
	Info_ClearChoices   (DIA_MiltenOW_Mana);
	Info_AddChoice 		(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenOW_Mana_1);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenOW_Mana_5);
	
};
func void DIA_MiltenOW_Mana_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output (self, other, "DIA_MiltenOW_Mana_03_00"); //Twoja magiczna moc i tak jest ogromna. Obawiam si�, �e nie mog� ci pom�c.
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
	description = "Czym si� tutaj zajmujesz?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Perm_15_00");//Czym si� tutaj zajmujesz?
	AI_Output (self ,other,"DIA_MiltenOW_Perm_03_01");//Mia�em sprawdza� czysto�� zgromadzonej rudy, ale na to przyjdzie mi chyba jeszcze poczeka�.
	AI_Output (self ,other,"DIA_MiltenOW_Perm_03_02");//Chwilowo bawi� si� w alchemika.
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
	description = "Co zamierzasz dalej robi�?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_00");//Co zamierzasz dalej robi�?
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_01");//Wr�ci� do klasztoru. Zaczekam tutaj jeszcze troch�, ale skoro Gorn zn�w jest na wolno�ci, mog� si� z nim zabra�.
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_02");//Pyrokar musi koniecznie dowiedzie� si� o wszystkim, co si� tutaj dzieje.
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_03");//Jak uwa�asz.
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_04");//Mam tylko nadziej�, �e Lord Hagen w�a�ciwie oceni zagro�enie. Wol� nie my�le�, co si� stanie, gdy orkowie przekrocz� prze��cz.
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_05");//Zatem bezpiecznej podr�y!
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
	description = "(Kradzie� tej mikstury b�dzie trudnym zadaniem)";
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



