


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
	AI_Output	(self ,other,"DIA_MiltenOW_Hello_03_00");//Kogo ja widzê! To nasz bohater zza Bariery!
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Mi³o ciê znowu widzieæ, Miltenie.",DIA_MiltenOW_Hello_YES);
	Info_AddChoice (DIA_MiltenOW_Hello,"A powinienem ich pamiêtaæ?",DIA_MiltenOW_Hello_NO);
};
	// ------------------------------------
	func void B_Milten_GornDiegoLester()
	{
		AI_Output 	(self ,other,"DIA_MiltenOW_Hello_NO_03_02"); //Pamiêtasz jeszcze Gorna, Diega i Lestera?
	};
	// ------------------------------------

FUNC VOID DIA_MiltenOW_Hello_YES()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_YES_15_00");//Mi³o ciê znowu widzieæ, Miltenie. A ty - CI¥GLE tutaj, czy ZNOWU tutaj?
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_01");//Znowu. Po upadku Bariery wróci³em do klasztoru Magów Ognia.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_02");//Ale gdy paladyni postanowili zejœæ do Doliny, moje doœwiadczenie i znajomoœæ terenu okaza³y siê bardzo przydatne.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_03");//Dlatego Najwy¿sza Rada wys³a³a mnie tutaj jako magiczne wsparcie dla ca³ej ekspedycji.
	B_Milten_GornDiegoLester();
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Oczywiœcie, ¿e ich pamiêtam!",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice (DIA_MiltenOW_Hello,"Te imiona nic mi nie mówi¹.",DIA_MiltenOW_Hello_Forget);
};
FUNC VOID DIA_MiltenOW_Hello_NO()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_NO_15_00");//A powinienem ich pamiêtaæ?
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_NO_03_01");//Przeszed³eœ przez niez³e piek³o, co?
	B_Milten_GornDiegoLester();
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Jak siê maj¹ sprawy?",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice (DIA_MiltenOW_Hello,"Te imiona nic mi nie mówi¹.",DIA_MiltenOW_Hello_Forget);
};
FUNC VOID DIA_MiltenOW_Hello_Friends()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_Friends_15_00");//Oczywiœcie, ¿e ich pamiêtam!
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_01");//Có¿, Gorn i Diego daleko nie zaszli. Zostali schwytani w Dolinie przez paladynów.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_02");//Tylko Lesterowi uda³o siê prysn¹æ, chocia¿ nie wiem, gdzie siê teraz podziewa.
	
	if (Npc_KnowsInfo (other, DIA_Lester_Hello)) 
	{
		AI_Output	(other,self ,"DIA_MiltenOW_Hello_Friends_15_03");//Spotka³em Lestera. Jest u Xardasa.
		AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_04");//Przynajmniej jedna dobra wiadomoœæ.
	};
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_05");//Có¿, nie mam dla ciebie ¿adnych dobrych wieœci.
	
	Knows_Diego = TRUE;
	Info_ClearChoices (DIA_MiltenOW_Hello);
};
FUNC VOID DIA_MiltenOW_Hello_Forget()
{
	AI_Output (other,self ,"DIA_MiltenOW_Hello_Forget_15_00");//Te imiona nic mi nie mówi¹.
	AI_Output (self ,other,"DIA_MiltenOW_Hello_Forget_03_01");//Wiele zapomnia³eœ... Zostawmy zatem przesz³oœæ i skoncentrujmy siê na teraŸniejszoœci.
	AI_Output (self ,other,"DIA_MiltenOW_Hello_Forget_03_02");//Mimo ¿e nie prezentuje siê ona najlepiej.
	
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
	description = "Jak siê maj¹ sprawy?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Bericht_15_00");//Jak siê maj¹ sprawy?
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_01");//Paladyni przybyli tutaj, ¿eby zgromadziæ jak najwiêcej magicznej rudy.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_02");//Ale bior¹c pod uwagê smocze ataki i orkow¹ armiê, œmiem w¹tpiæ, czy im siê to uda.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_03");//Nie, na Innosa. Wyczuwam tu obecnoœæ czegoœ mrocznego... czegoœ bardzo z³ego. Ponura moc wype³nia ca³¹ Dolinê.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_04");//Cena za zwyciêstwo nad Œni¹cym okaza³a siê bardzo wysoka. Upadek Bariery to prawdziwa katastrofa.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_05");//Jeœli to przetrwamy, mo¿emy mówiæ o prawdziwym szczêœciu.
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
	description = "Ile rudy zgromadziliœcie do tej pory?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Erz_15_00");//Ile rudy zgromadziliœcie do tej pory?
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_01");//Ile rudy? Ani bry³ki! Od jakiegoœ czasu nie mamy ¿adnych wieœci od górników.
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_02");//Nie zdziwi³bym siê, gdyby ju¿ nie ¿yli. A na domiar z³ego jesteœmy atakowani przez smoki i hordê orków!
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_03");//Ta wyprawa to jedno wielkie niepowodzenie!
	
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
	description = "Gdzie s¹ teraz Gorn i Diego?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Wo_Forget_15_00");//Gdzie s¹ teraz Gorn i Diego?
	AI_Output (self ,other,"DIA_MiltenOW_Wo_Forget_03_01");//Có¿. Gorn siedzi w tutejszym lochu za stawianie oporu paladynom.
	AI_Output (self ,other,"DIA_MiltenOW_Wo_Forget_03_02");//Diego zosta³ przydzielony do grupy górników. Porozmawiaj z paladynem imieniem Parcival. To on dobiera³ ludzi.
	
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
	description = "ChodŸmy uwolniæ Gorna!";
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
	AI_Output (other,self ,"DIA_MiltenOW_Gorn_15_00");//ChodŸmy uwolniæ Gorna!
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_01");//To nie takie proste! Gorn jest skazañcem.
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_02");//Przy odrobinie szczêœcia Garond wyznaczy jak¹œ grzywnê, po której zap³aceniu Gorn odzyska wolnoœæ.
	AI_Output (other,self ,"DIA_MiltenOW_Gorn_15_03");//Tak, to mo¿liwe...
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_04");//Daj mi znaæ, gdybyœ siê czegoœ dowiedzia³.
	
	Log_CreateTopic (TOPIC_RescueGorn,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_RescueGorn,LOG_RUNNING);
	B_LogEntry (TOPIC_RescueGorn,"Kapitan Garond kaza³ wsadziæ Gorna do wiêzienia. Mo¿e uda nam siê go jakoœ uwolniæ.");
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
	description = "Garond domaga siê 1000 sztuk z³ota za uwolnienie Gorna.";
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
	AI_Output (other,self ,"DIA_MiltenOW_Preis_15_00");//Garond domaga siê 1000 sztuk z³ota za uwolnienie Gorna.
	AI_Output (self ,other,"DIA_MiltenOW_Preis_03_01");//Niez³a sumka. Mogê dorzuciæ 250 sztuk z mojej kieszeni.
	
	B_GiveInvItems (self, other, Itmi_gold, 250);
	B_LogEntry (TOPIC_RescueGorn,"Milten da³ mi 250 sztuk z³ota, abym zap³aci³ za wypuszczenie Gorna z wiêzienia.");

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
	description = "To za ma³o. Muszê jakoœ zdobyæ ca³¹ resztê.";
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
	AI_Output (other,self ,"DIA_MiltenOW_Mehr_15_00");//To za ma³o. Muszê jakoœ zdobyæ ca³¹ resztê.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_01");//Zdobyæ wiêcej z³ota... hmmm. Diego jest w tym specjalist¹, ale go tu nie ma...
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_02");//Mo¿e sam Gorn od³o¿y³ gdzieœ trochê z³ota? Powinniœmy siê tego dowiedzieæ.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_03");//Czekaj. Napiszê do niego list. Spróbuj go jakoœ przemyciæ do lochu.
	
	B_GiveInvItems(self,other,ItWr_LetterForGorn_MIS,1);	 
	B_LogEntry (TOPIC_RescueGorn,"Milten da³ mi wiadomoœæ dla Gorna. Jeœli zdo³am j¹ przemyciæ do wiêzienia, mo¿e dowiedziemy siê, czy Gorn posiada jakieœ zapasy z³ota.");
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
	description = "Masz mo¿e dla mnie jakieœ wyposa¿enie?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Equipmentt_15_00");//Masz mo¿e dla mnie jakieœ wyposa¿enie? Garond kaza³ mi odwiedziæ kopalnie.
	AI_Output (self ,other,"DIA_MiltenOW_Equipment_03_01");//Sk¹d niby mia³bym je wzi¹æ? Jeœli chcesz, mogê ci daæ runiczny kamieñ.
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
	description = "Mam odpowiedŸ od Gorna..."; 
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
	AI_Output	(other,self ,"DIA_MiltenOW_Versteck_15_00"); //Mam odpowiedŸ od Gorna. Podobno ukry³ z³oto gdzieœ przy po³udniowej bramie.
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_01"); //DAWNEJ po³udniowej bramie, chcia³eœ powiedzieæ. Smok obróci³ j¹ w zupe³n¹ ruinê.
	AI_Output	(other,self ,"DIA_MiltenOW_Versteck_15_02"); //Jak siê tam dostaæ?
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_03"); //To niedaleko tarana orków. Po³udniowa brama by³a na prawo od niego.
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_04"); //To nie bêdzie ³atwy spacerek. Uwa¿aj na siebie i œpiesz siê!
	
	B_LogEntry (TOPIC_RescueGorn,"By³a po³udniowa brama znajduje siê na prawo od orkowego tarana. Gorn ukry³ z³oto gdzieœ w tej okolicy.");
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
	description = "Uwolni³em Gorna.";
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
	AI_Output (other,self ,"DIA_MiltenOW_Frei_15_00");//Uwolni³em Gorna.
	AI_Output (self ,other,"DIA_MiltenOW_Frei_03_01");//Dobra robota. Zastanówmy siê, co dalej.
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
	description = "Mo¿esz mnie czegoœ nauczyæ?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Lehren_15_00");//Mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self ,other,"DIA_MiltenOW_Lehren_03_01");//Mogê nauczyæ ciê niektórych zaklêæ z drugiego krêgu magii albo zwiêkszyæ trochê twoj¹ magiczn¹ moc.
	AI_Output (self ,other,"DIA_MiltenOW_Lehren_03_02");//Jeœli jesteœ gotów zwiêkszyæ swoj¹ magiczn¹ moc, mogê ci pomóc.
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
	description = "WprowadŸ mnie do drugiego krêgu magii!";
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
	AI_Output (other, self, "DIA_Milten_Add_15_00"); //WprowadŸ mnie do drugiego krêgu magii!
	AI_Output (self, other, "DIA_Milten_Add_03_01"); //W zasadzie powinien siê tym zaj¹æ któryœ z nauczycieli naszego zakonu...
	AI_Output (self, other, "DIA_Milten_Add_03_02"); //...ale w tej sytuacji mo¿emy chyba zrobiæ wyj¹tek.
	
	if (B_TeachMagicCircle (self, other, 2))
	{
		AI_Output (self, other, "DIA_Milten_Add_03_03"); //Nie wiem, czy pamiêtam oficjaln¹ formu³kê...
		AI_Output (self, other, "DIA_Milten_Add_03_04"); //Oto wkraczasz w drugi kr¹g magii... Eee... Magia wska¿e ci drogê, ale to twoje czyny ciê ni¹ poprowadz¹... Czy coœ w tym stylu...
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
	description = "Chcê siê nauczyæ nowych zaklêæ.";
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
	AI_Output (other,self ,"DIA_MiltenOW_Teach_15_00");//Chcê siê nauczyæ nowych zaklêæ.
	
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
		AI_Output (self ,other,"DIA_MiltenOW_Teach_03_01");//Nie pozna³eœ jeszcze drugiego krêgu magii. Nie mogê ciê niczego nauczyæ.
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
	description	 = 	"Chcê zwiêkszyæ moj¹ magiczn¹ moc.";
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
	AI_Output (other, self, "DIA_MiltenOW_Mana_15_00"); //Chcê zwiêkszyæ moj¹ magiczn¹ moc.
	
	Info_ClearChoices   (DIA_MiltenOW_Mana);
	Info_AddChoice 		(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenOW_Mana_1);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenOW_Mana_5);
	
};
func void DIA_MiltenOW_Mana_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output (self, other, "DIA_MiltenOW_Mana_03_00"); //Twoja magiczna moc i tak jest ogromna. Obawiam siê, ¿e nie mogê ci pomóc.
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
	description = "Czym siê tutaj zajmujesz?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Perm_15_00");//Czym siê tutaj zajmujesz?
	AI_Output (self ,other,"DIA_MiltenOW_Perm_03_01");//Mia³em sprawdzaæ czystoœæ zgromadzonej rudy, ale na to przyjdzie mi chyba jeszcze poczekaæ.
	AI_Output (self ,other,"DIA_MiltenOW_Perm_03_02");//Chwilowo bawiê siê w alchemika.
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
	description = "Co zamierzasz dalej robiæ?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_00");//Co zamierzasz dalej robiæ?
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_01");//Wróciæ do klasztoru. Zaczekam tutaj jeszcze trochê, ale skoro Gorn znów jest na wolnoœci, mogê siê z nim zabraæ.
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_02");//Pyrokar musi koniecznie dowiedzieæ siê o wszystkim, co siê tutaj dzieje.
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_03");//Jak uwa¿asz.
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_04");//Mam tylko nadziejê, ¿e Lord Hagen w³aœciwie oceni zagro¿enie. Wolê nie myœleæ, co siê stanie, gdy orkowie przekrocz¹ prze³êcz.
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_05");//Zatem bezpiecznej podró¿y!
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
	description = "(Kradzie¿ tej mikstury bêdzie trudnym zadaniem)";
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



