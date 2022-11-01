


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
	AI_Output	(self ,other,"DIA_MiltenOW_Hello_03_00");//Kogo ja widzę! To nasz bohater zza Bariery!
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Miło cię znowu widzieć, Miltenie.",DIA_MiltenOW_Hello_YES);
	Info_AddChoice (DIA_MiltenOW_Hello,"A powinienem ich pamiętać?",DIA_MiltenOW_Hello_NO);
};
	// ------------------------------------
	func void B_Milten_GornDiegoLester()
	{
		AI_Output 	(self ,other,"DIA_MiltenOW_Hello_NO_03_02"); //Pamiętasz jeszcze Gorna, Diega i Lestera?
	};
	// ------------------------------------

FUNC VOID DIA_MiltenOW_Hello_YES()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_YES_15_00");//Miło cię znowu widzieć, Miltenie. A ty - CIĄGLE tutaj, czy ZNOWU tutaj?
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_01");//Znowu. Po upadku Bariery wróciłem do klasztoru Magów Ognia.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_02");//Ale gdy paladyni postanowili zejść do Doliny, moje doświadczenie i znajomość terenu okazały się bardzo przydatne.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_YES_03_03");//Dlatego Najwyższa Rada wysłała mnie tutaj jako magiczne wsparcie dla całej ekspedycji.
	B_Milten_GornDiegoLester();
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Oczywiście, że ich pamiętam!",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice (DIA_MiltenOW_Hello,"Te imiona nic mi nie mówią.",DIA_MiltenOW_Hello_Forget);
};
FUNC VOID DIA_MiltenOW_Hello_NO()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_NO_15_00");//A powinienem ich pamiętać?
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_NO_03_01");//Przeszedłeś przez niezłe piekło, co?
	B_Milten_GornDiegoLester();
	
	Info_ClearChoices (DIA_MiltenOW_Hello);
	Info_AddChoice (DIA_MiltenOW_Hello,"Jak się mają sprawy?",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice (DIA_MiltenOW_Hello,"Te imiona nic mi nie mówią.",DIA_MiltenOW_Hello_Forget);
};
FUNC VOID DIA_MiltenOW_Hello_Friends()
{
	AI_Output	(other,self ,"DIA_MiltenOW_Hello_Friends_15_00");//Oczywiście, że ich pamiętam!
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_01");//Cóż, Gorn i Diego daleko nie zaszli. Zostali schwytani w Dolinie przez paladynów.
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_02");//Tylko Lesterowi udało się prysnąć, chociaż nie wiem, gdzie się teraz podziewa.
	
	if (Npc_KnowsInfo (other, DIA_Lester_Hello)) 
	{
		AI_Output	(other,self ,"DIA_MiltenOW_Hello_Friends_15_03");//Spotkałem Lestera. Jest u Xardasa.
		AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_04");//Przynajmniej jedna dobra wiadomość.
	};
	AI_Output 	(self ,other,"DIA_MiltenOW_Hello_Friends_03_05");//Cóż, nie mam dla ciebie żadnych dobrych wieści.
	
	Knows_Diego = TRUE;
	Info_ClearChoices (DIA_MiltenOW_Hello);
};
FUNC VOID DIA_MiltenOW_Hello_Forget()
{
	AI_Output (other,self ,"DIA_MiltenOW_Hello_Forget_15_00");//Te imiona nic mi nie mówią.
	AI_Output (self ,other,"DIA_MiltenOW_Hello_Forget_03_01");//Wiele zapomniałeś... Zostawmy zatem przeszłość i skoncentrujmy się na teraźniejszości.
	AI_Output (self ,other,"DIA_MiltenOW_Hello_Forget_03_02");//Mimo że nie prezentuje się ona najlepiej.
	
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
	description = "Jak się mają sprawy?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Bericht_15_00");//Jak się mają sprawy?
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_01");//Paladyni przybyli tutaj, żeby zgromadzić jak najwięcej magicznej rudy.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_02");//Ale biorąc pod uwagę smocze ataki i orkową armię, śmiem wątpić, czy im się to uda.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_03");//Nie, na Innosa. Wyczuwam tu obecność czegoś mrocznego... czegoś bardzo złego. Ponura moc wypełnia całą Dolinę.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_04");//Cena za zwycięstwo nad Śniącym okazała się bardzo wysoka. Upadek Bariery to prawdziwa katastrofa.
	AI_Output (self ,other,"DIA_MiltenOW_Bericht_03_05");//Jeśli to przetrwamy, możemy mówić o prawdziwym szczęściu.
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
	description = "Ile rudy zgromadziliście do tej pory?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Erz_15_00");//Ile rudy zgromadziliście do tej pory?
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_01");//Ile rudy? Ani bryłki! Od jakiegoś czasu nie mamy żadnych wieści od górników.
	AI_Output (self ,other,"DIA_MiltenOW_Erz_03_02");//Nie zdziwiłbym się, gdyby już nie żyli. A na domiar złego jesteśmy atakowani przez smoki i hordę orków!
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
	description = "Gdzie są teraz Gorn i Diego?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Wo_Forget_15_00");//Gdzie są teraz Gorn i Diego?
	AI_Output (self ,other,"DIA_MiltenOW_Wo_Forget_03_01");//Cóż. Gorn siedzi w tutejszym lochu za stawianie oporu paladynom.
	AI_Output (self ,other,"DIA_MiltenOW_Wo_Forget_03_02");//Diego został przydzielony do grupy górników. Porozmawiaj z paladynem imieniem Parcival. To on dobierał ludzi.
	
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
	description = "Chodźmy uwolnić Gorna!";
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
	AI_Output (other,self ,"DIA_MiltenOW_Gorn_15_00");//Chodźmy uwolnić Gorna!
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_01");//To nie takie proste! Gorn jest skazańcem.
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_02");//Przy odrobinie szczęścia Garond wyznaczy jakąś grzywnę, po której zapłaceniu Gorn odzyska wolność.
	AI_Output (other,self ,"DIA_MiltenOW_Gorn_15_03");//Tak, to możliwe...
	AI_Output (self ,other,"DIA_MiltenOW_Gorn_03_04");//Daj mi znać, gdybyś się czegoś dowiedział.
	
	Log_CreateTopic (TOPIC_RescueGorn,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_RescueGorn,LOG_RUNNING);
	B_LogEntry (TOPIC_RescueGorn,"Kapitan Garond kazał wsadzić Gorna do więzienia. Może uda nam się go jakoś uwolnić.");
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
	description = "Garond domaga się 1000 sztuk złota za uwolnienie Gorna.";
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
	AI_Output (other,self ,"DIA_MiltenOW_Preis_15_00");//Garond domaga się 1000 sztuk złota za uwolnienie Gorna.
	AI_Output (self ,other,"DIA_MiltenOW_Preis_03_01");//Niezła sumka. Mogę dorzucić 250 sztuk z mojej kieszeni.
	
	B_GiveInvItems (self, other, Itmi_gold, 250);
	B_LogEntry (TOPIC_RescueGorn,"Milten dał mi 250 sztuk złota, abym zapłacił za wypuszczenie Gorna z więzienia.");

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
	description = "To za mało. Muszę jakoś zdobyć całą resztę.";
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
	AI_Output (other,self ,"DIA_MiltenOW_Mehr_15_00");//To za mało. Muszę jakoś zdobyć całą resztę.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_01");//Zdobyć więcej złota... hmmm. Diego jest w tym specjalistą, ale go tu nie ma...
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_02");//Może sam Gorn odłożył gdzieś trochę złota? Powinniśmy się tego dowiedzieć.
	AI_Output (self ,other,"DIA_MiltenOW_Mehr_03_03");//Czekaj. Napiszę do niego list. Spróbuj go jakoś przemycić do lochu.
	
	B_GiveInvItems(self,other,ItWr_LetterForGorn_MIS,1);	 
	B_LogEntry (TOPIC_RescueGorn,"Milten dał mi wiadomość dla Gorna. Jeśli zdołam ją przemycić do więzienia, może dowiedziemy się, czy Gorn posiada jakieś zapasy złota.");
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
	description = "Masz może dla mnie jakieś wyposażenie?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Equipmentt_15_00");//Masz może dla mnie jakieś wyposażenie? Garond kazał mi odwiedzić kopalnie.
	AI_Output (self ,other,"DIA_MiltenOW_Equipment_03_01");//Skąd niby miałbym je wziąć? Jeśli chcesz, mogę ci dać runiczny kamień.
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
	description = "Mam odpowiedź od Gorna..."; 
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
	AI_Output	(other,self ,"DIA_MiltenOW_Versteck_15_00"); //Mam odpowiedź od Gorna. Podobno ukrył złoto gdzieś przy południowej bramie.
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_01"); //DAWNEJ południowej bramie, chciałeś powiedzieć. Smok obrócił ją w zupełną ruinę.
	AI_Output	(other,self ,"DIA_MiltenOW_Versteck_15_02"); //Jak się tam dostać?
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_03"); //To niedaleko tarana orków. Południowa brama była na prawo od niego.
	AI_Output	(self ,other,"DIA_MiltenOW_Versteck_03_04"); //To nie będzie łatwy spacerek. Uważaj na siebie i śpiesz się!
	
	B_LogEntry (TOPIC_RescueGorn,"Była południowa brama znajduje się na prawo od orkowego tarana. Gorn ukrył złoto gdzieś w tej okolicy.");
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
	description = "Uwolniłem Gorna.";
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
	AI_Output (other,self ,"DIA_MiltenOW_Frei_15_00");//Uwolniłem Gorna.
	AI_Output (self ,other,"DIA_MiltenOW_Frei_03_01");//Dobra robota. Zastanówmy się, co dalej.
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
	description = "Możesz mnie czegoś nauczyć?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Lehren_15_00");//Możesz mnie czegoś nauczyć?
	AI_Output (self ,other,"DIA_MiltenOW_Lehren_03_01");//Mogę nauczyć cię niektórych zaklęć z drugiego kręgu magii albo zwiększyć trochę twoją magiczną moc.
	AI_Output (self ,other,"DIA_MiltenOW_Lehren_03_02");//Jeśli jesteś gotów zwiększyć swoją magiczną moc, mogę ci pomóc.
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
	description = "Wprowadź mnie do drugiego kręgu magii!";
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
	AI_Output (other, self, "DIA_Milten_Add_15_00"); //Wprowadź mnie do drugiego kręgu magii!
	AI_Output (self, other, "DIA_Milten_Add_03_01"); //W zasadzie powinien się tym zająć któryś z nauczycieli naszego zakonu...
	AI_Output (self, other, "DIA_Milten_Add_03_02"); //...ale w tej sytuacji możemy chyba zrobić wyjątek.
	
	if (B_TeachMagicCircle (self, other, 2))
	{
		AI_Output (self, other, "DIA_Milten_Add_03_03"); //Nie wiem, czy pamiętam oficjalną formułkę...
		AI_Output (self, other, "DIA_Milten_Add_03_04"); //Oto wkraczasz w drugi krąg magii... Eee... Magia wskaże ci drogę, ale to twoje czyny cię nią poprowadzą... Czy coś w tym stylu...
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
	description = "Chcę się nauczyć nowych zaklęć.";
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
	AI_Output (other,self ,"DIA_MiltenOW_Teach_15_00");//Chcę się nauczyć nowych zaklęć.
	
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
		AI_Output (self ,other,"DIA_MiltenOW_Teach_03_01");//Nie poznałeś jeszcze drugiego kręgu magii. Nie mogę cię niczego nauczyć.
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
	description	 = 	"Chcę zwiększyć moją magiczną moc.";
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
	AI_Output (other, self, "DIA_MiltenOW_Mana_15_00"); //Chcę zwiększyć moją magiczną moc.
	
	Info_ClearChoices   (DIA_MiltenOW_Mana);
	Info_AddChoice 		(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1	, B_GetLearnCostAttribute(other, ATR_MANA_MAX))		,DIA_MiltenOW_Mana_1);
	Info_AddChoice		(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5	, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5)	,DIA_MiltenOW_Mana_5);
	
};
func void DIA_MiltenOW_Mana_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output (self, other, "DIA_MiltenOW_Mana_03_00"); //Twoja magiczna moc i tak jest ogromna. Obawiam się, że nie mogę ci pomóc.
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
	description = "Czym się tutaj zajmujesz?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Perm_15_00");//Czym się tutaj zajmujesz?
	AI_Output (self ,other,"DIA_MiltenOW_Perm_03_01");//Miałem sprawdzać czystość zgromadzonej rudy, ale na to przyjdzie mi chyba jeszcze poczekać.
	AI_Output (self ,other,"DIA_MiltenOW_Perm_03_02");//Chwilowo bawię się w alchemika.
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
	description = "Co zamierzasz dalej robić?";
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
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_00");//Co zamierzasz dalej robić?
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_01");//Wrócić do klasztoru. Zaczekam tutaj jeszcze trochę, ale skoro Gorn znów jest na wolności, mogę się z nim zabrać.
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_02");//Pyrokar musi koniecznie dowiedzieć się o wszystkim, co się tutaj dzieje.
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_03");//Jak uważasz.
	AI_Output (self ,other,"DIA_MiltenOW_Plan_03_04");//Mam tylko nadzieję, że Lord Hagen właściwie oceni zagrożenie. Wolę nie myśleć, co się stanie, gdy orkowie przekroczą przełęcz.
	AI_Output (other,self ,"DIA_MiltenOW_Plan_15_05");//Zatem bezpiecznej podróży!
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
	description = "(Kradzież tej mikstury będzie trudnym zadaniem)";
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



