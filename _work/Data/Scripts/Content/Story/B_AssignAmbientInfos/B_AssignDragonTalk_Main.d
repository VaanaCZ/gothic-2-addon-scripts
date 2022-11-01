// *************************************************************************
// 									Drachenfrage 1
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_1(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_1_Condition;
	information	= DIA_DragonTalk_Main_1_Info;
	permanent	= FALSE;
	description = "Co cię sprowadza do tego miejsca?";
};                       

FUNC INT DIA_DragonTalk_Main_1_Condition()
{
	if (MIS_KilledDragons == 0)
	{
		return 1;
	};	
};

FUNC VOID DIA_DragonTalk_Main_1_Info()
{	

	AI_Output			(other, self, "DIA_DragonTalk_Main_1_15_00"); //Sługo ciemności! Co cię sprowadza do tego miejsca? Czy twoim jedynym celem jest sianie strachu i zniszczenia?
	AI_Output			(self, other, "DIA_DragonTalk_Main_1_20_01"); //Prawdziwy cel naszego przybycia do tego świata nigdy nie zostanie ci wyjawiony, człowiecze.

	Info_AddChoice	(DIA_DragonTalk_Main_1, "Jak mam zmusić do mówienia pozostałe smoki?", DIA_DragonTalk_Main_1_reden );
	Info_AddChoice	(DIA_DragonTalk_Main_1, "Co muszę zrobić, aby ponownie cię wygnać?", DIA_DragonTalk_Main_1_verbannen );

	DragonTalk_Exit_Free = TRUE;
};
func void DIA_DragonTalk_Main_1_verbannen ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_verbannen_15_00"); //Na Innosa, co mam uczynić, by przegnać was precz z królestwa ludzi?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_01"); //By tego dokonać, musiałbyś najpierw zrozumieć znaczenie naszego spotkania.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_02"); //Ale żaden z nas nie wyjawi ci go z własnej woli.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_03"); //Tylko Oko mogłoby rozwiązać nasze języki i wyjawić ci nasz prawdziwy cel.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_04"); //W każdym razie, po swojej śmierci niewiele będziesz miał z tej wiedzy pożytku.
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_05"); //Doniesiono nam, że obrałeś drogę łowcy smoków.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_06"); //Dlatego wysłaliśmy do twojego świata nasz pomiot, by zapewnić przetrwanie naszej starożytnej dynastii.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_07"); //Przegrałeś tę wojnę, mały człowieczku.
		
		Log_CreateTopic (TOPIC_DRACHENEIER, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DRACHENEIER, LOG_RUNNING);
		B_LogEntry (TOPIC_DRACHENEIER,"Jeden z tych smoków mamrotał coś o 'potomkach' i utrzymaniu ciągłości jego rodu. Boję się, że te potwory rozpleniły się po całym cywilizowanym świecie."); 
	}
	else
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_08"); //Oko pozwala ci rzucić mi wyzwanie, ale to w walce okaże się, czy jesteś mnie godzien.
	};
};

func void DIA_DragonTalk_Main_1_reden ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_reden_15_00"); //Jak mam zmusić do mówienia pozostałe smoki?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_01"); //Tylko moje serce pozwoli ci odnowić moc Oka.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_02"); //Ale nigdy nie zdołasz wyrwać go z mojej piersi.

};


// *************************************************************************
// 									Drachenfrage 2
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_2(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_2_Condition;
	information	= DIA_DragonTalk_Main_2_Info;
	permanent	= FALSE;
	description = "Kto was tu przysłał?";
};                       

FUNC INT DIA_DragonTalk_Main_2_Condition()
{
	if (MIS_KilledDragons == 1)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_2_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_2_15_00"); //Kto wam rozkazuje? Kto was tu przysłał?
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_01"); //Naszymi czynami kieruje nasz Pan i jego Słowo Mocy. Wkrótce nikt nie zdoła oprzeć się jego woli.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_02"); //Jego ramię sięga daleko poza Królestwo Umarłych. Duchy nocy gromadzą się wokół, oczekując jego nadejścia.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_03"); //Wkrótce zostaniecie pokonani, a on zapanuje nad światem.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_04"); //W porównaniu z nim, nawet my jesteśmy nic nie znaczącym pyłem.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_05"); //Nasz Pan nadejdzie, by wskrzesić wasze ciała z popiołów i wykorzystać je do podporządkowania sobie tego świata.

	B_LogEntry (TOPIC_DRACHENJAGD,"Te smoki nie są samodzielnymi istotami. Służą jakiemuś panu, o którym nie chcą mówić - no, może poza bezwartościowymi przepowiedniami w stylu 'nasz pan przyjdzie i zniszczy świat, bla bla bla'. Nic nowego."); 
	
	DragonTalk_Exit_Free = TRUE;
};


// *************************************************************************
// 									Drachenfrage 3
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_3(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_3_Condition;
	information	= DIA_DragonTalk_Main_3_Info;
	permanent	= FALSE;
	description = "Jak mogę pokonać twego pana?";
};                       

FUNC INT DIA_DragonTalk_Main_3_Condition()
{
	if (MIS_KilledDragons == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_3_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_00"); //Jak mogę pokonać twego pana?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_01"); //Mój Pan jest wszechpotężny i niemal niezwyciężony. Gdybyś okazał się wystarczająco głupi, by stawić mu czoła, czeka cię długa, powolna śmierć w okrutnych męczarniach.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_02"); //Nie pierwszy raz słyszę coś takiego. NIEMAL niezwyciężony, a więc można go pokonać!
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_03"); //Mów więc! Co muszę uczynić?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_04"); //Aby stawić mu czoła, musisz posiadać rzeczy, których on nigdy nie pozwoli ci zdobyć.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_05"); //Co dokładnie?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_06"); //Musisz posiąść najwspanialszą zbroję, jaką widział ten świat, i założyć ją do ostatniego starcia.

	if (other.guild == GIL_PAL) || (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_01"); //Potrzebujesz miecza pobłogosławionego przez twojego boga.
	}
	else if (other.guild == GIL_KDF) || (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_02"); //Potrzebujesz runy, która powstała specjalnie dla ciebie.
	}
	else //Sld - Djg
	{	
		AI_Output (self, other, "DIA_Dragons_Add_20_00"); //Potrzebujesz oręża, który wykonano specjalnie dla ciebie.
	};
	
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_08"); //Ale najtrudniejszym do spełnienia warunkiem jest znalezienie pięciu towarzyszy gotowych pójść za tobą na pewną śmierć.
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_09"); //Dopiero wtedy możesz stawić czoła mojemu Panu.
	
	DragonTalk_Exit_Free = TRUE;
};


// *************************************************************************
// 									Drachenfrage 4
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_4(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_4_Condition;
	information	= DIA_DragonTalk_Main_4_Info;
	permanent	= FALSE;
	description 	= "Gdzie znajdę twego pana?";
};                       

FUNC INT DIA_DragonTalk_Main_4_Condition()
{
	if (MIS_KilledDragons == 3)
	{
		return 1;
	};
};

FUNC VOID DIA_DragonTalk_Main_4_Info()
{	
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_00"); //Gdzie znajdę twego pana?
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_01"); //Jego skarbiec znajduje się w kamiennym Dworze Irdorath. Tam go szukaj.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_02"); //Póki nie uda mu się przywrócić właściwego porządku świata, będzie tam spoczywał, pogrążony w zadumie...
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_03"); //Daruj sobie szczegóły. Powiedz mi lepiej, gdzie się znajduje ten Dwór Irdorath.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_04"); //Ha, ha, ha. Rozczarowałeś mnie, człowieczku. Przezwyciężyłeś tyle przeciwności i pokonałeś niemal wszystkich z nas, a teraz ośmieszasz się własną niewiedzą.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_05"); //Jeśli nazwa Irdorath nic ci nie mówi, lepiej udaj się do swoich magów i poproś, by pozwolili ci sobie usługiwać.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_06"); //Bo najwyraźniej nie jesteś jeszcze gotów, by dźwigać brzemię prawdziwej wiedzy.
	 
	Log_CreateTopic (TOPIC_BuchHallenVonIrdorath, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BuchHallenVonIrdorath, LOG_RUNNING);
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"Władca smoków skrył się podobno w potężnym i świętym Dworze Irdorath. To brzmi jakoś znajomo. Gdzie to ja mogłem o tym czytać?"); 

	B_NPC_IsAliveCheck (OLDWORLD_ZEN);  //Joly: bringt Angar und Gorn in die NW.
	DragonTalk_Exit_Free = TRUE;
};


//**********************************************************************************
//		B_AssignDragonTalk_Main
//**********************************************************************************

FUNC VOID B_AssignDragonTalk_Main (var c_NPC slf)
{
	DIA_DragonTalk_Main_1.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_2.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_3.npc				= Hlp_GetInstanceID(slf);
	DIA_DragonTalk_Main_4.npc				= Hlp_GetInstanceID(slf);	
};













