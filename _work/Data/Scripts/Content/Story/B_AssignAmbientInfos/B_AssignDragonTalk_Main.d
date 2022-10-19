// *************************************************************************
// 									Drachenfrage 1
// *************************************************************************
INSTANCE DIA_DragonTalk_Main_1(C_INFO)
{
	
	nr			= 10;
	condition	= DIA_DragonTalk_Main_1_Condition;
	information	= DIA_DragonTalk_Main_1_Info;
	permanent	= FALSE;
	description = "Co ci� sprowadza do tego miejsca?";
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

	AI_Output			(other, self, "DIA_DragonTalk_Main_1_15_00"); //S�ugo ciemno�ci! Co ci� sprowadza do tego miejsca? Czy twoim jedynym celem jest sianie strachu i zniszczenia?
	AI_Output			(self, other, "DIA_DragonTalk_Main_1_20_01"); //Prawdziwy cel naszego przybycia do tego �wiata nigdy nie zostanie ci wyjawiony, cz�owiecze.

	Info_AddChoice	(DIA_DragonTalk_Main_1, "Jak mam zmusi� do m�wienia pozosta�e smoki?", DIA_DragonTalk_Main_1_reden );
	Info_AddChoice	(DIA_DragonTalk_Main_1, "Co musz� zrobi�, aby ponownie ci� wygna�?", DIA_DragonTalk_Main_1_verbannen );

	DragonTalk_Exit_Free = TRUE;
};
func void DIA_DragonTalk_Main_1_verbannen ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_verbannen_15_00"); //Na Innosa, co mam uczyni�, by przegna� was precz z kr�lestwa ludzi?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_01"); //By tego dokona�, musia�by� najpierw zrozumie� znaczenie naszego spotkania.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_02"); //Ale �aden z nas nie wyjawi ci go z w�asnej woli.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_03"); //Tylko Oko mog�oby rozwi�za� nasze j�zyki i wyjawi� ci nasz prawdziwy cel.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_04"); //W ka�dym razie, po swojej �mierci niewiele b�dziesz mia� z tej wiedzy po�ytku.
	
	if (hero.guild == GIL_DJG)
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_05"); //Doniesiono nam, �e obra�e� drog� �owcy smok�w.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_06"); //Dlatego wys�ali�my do twojego �wiata nasz pomiot, by zapewni� przetrwanie naszej staro�ytnej dynastii.
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_07"); //Przegra�e� t� wojn�, ma�y cz�owieczku.
		
		Log_CreateTopic (TOPIC_DRACHENEIER, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DRACHENEIER, LOG_RUNNING);
		B_LogEntry (TOPIC_DRACHENEIER,"Jeden z tych smok�w mamrota� co� o 'potomkach' i utrzymaniu ci�g�o�ci jego rodu. Boj� si�, �e te potwory rozpleni�y si� po ca�ym cywilizowanym �wiecie."); 
	}
	else
	{
		AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_verbannen_20_08"); //Oko pozwala ci rzuci� mi wyzwanie, ale to w walce oka�e si�, czy jeste� mnie godzien.
	};
};

func void DIA_DragonTalk_Main_1_reden ()
{
	AI_Output			(other, self, "DIA_DragonTalk_MAIN_1_reden_15_00"); //Jak mam zmusi� do m�wienia pozosta�e smoki?
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_01"); //Tylko moje serce pozwoli ci odnowi� moc Oka.
	AI_Output			(self, other, "DIA_DragonTalk_MAIN_1_reden_20_02"); //Ale nigdy nie zdo�asz wyrwa� go z mojej piersi.

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
	description = "Kto was tu przys�a�?";
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
	AI_Output			(other, self, "DIA_DragonTalk_Main_2_15_00"); //Kto wam rozkazuje? Kto was tu przys�a�?
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_01"); //Naszymi czynami kieruje nasz Pan i jego S�owo Mocy. Wkr�tce nikt nie zdo�a oprze� si� jego woli.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_02"); //Jego rami� si�ga daleko poza Kr�lestwo Umar�ych. Duchy nocy gromadz� si� wok�, oczekuj�c jego nadej�cia.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_03"); //Wkr�tce zostaniecie pokonani, a on zapanuje nad �wiatem.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_04"); //W por�wnaniu z nim, nawet my jeste�my nic nie znacz�cym py�em.
	AI_Output			(self, other, "DIA_DragonTalk_Main_2_20_05"); //Nasz Pan nadejdzie, by wskrzesi� wasze cia�a z popio��w i wykorzysta� je do podporz�dkowania sobie tego �wiata.

	B_LogEntry (TOPIC_DRACHENJAGD,"Te smoki nie s� samodzielnymi istotami. S�u�� jakiemu� panu, o kt�rym nie chc� m�wi� - no, mo�e poza bezwarto�ciowymi przepowiedniami w stylu 'nasz pan przyjdzie i zniszczy �wiat, bla bla bla'. Nic nowego."); 
	
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
	description = "Jak mog� pokona� twego pana?";
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
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_00"); //Jak mog� pokona� twego pana?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_01"); //M�j Pan jest wszechpot�ny i niemal niezwyci�ony. Gdyby� okaza� si� wystarczaj�co g�upi, by stawi� mu czo�a, czeka ci� d�uga, powolna �mier� w okrutnych m�czarniach.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_02"); //Nie pierwszy raz s�ysz� co� takiego. NIEMAL niezwyci�ony, a wi�c mo�na go pokona�!
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_03"); //M�w wi�c! Co musz� uczyni�?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_04"); //Aby stawi� mu czo�a, musisz posiada� rzeczy, kt�rych on nigdy nie pozwoli ci zdoby�.
	AI_Output			(other, self, "DIA_DragonTalk_Main_3_15_05"); //Co dok�adnie?
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_06"); //Musisz posi��� najwspanialsz� zbroj�, jak� widzia� ten �wiat, i za�o�y� j� do ostatniego starcia.

	if (other.guild == GIL_PAL) || (other.guild == GIL_MIL)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_01"); //Potrzebujesz miecza pob�ogos�awionego przez twojego boga.
	}
	else if (other.guild == GIL_KDF) || (other.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Dragons_Add_20_02"); //Potrzebujesz runy, kt�ra powsta�a specjalnie dla ciebie.
	}
	else //Sld - Djg
	{	
		AI_Output (self, other, "DIA_Dragons_Add_20_00"); //Potrzebujesz or�a, kt�ry wykonano specjalnie dla ciebie.
	};
	
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_08"); //Ale najtrudniejszym do spe�nienia warunkiem jest znalezienie pi�ciu towarzyszy gotowych p�j�� za tob� na pewn� �mier�.
	AI_Output			(self, other, "DIA_DragonTalk_Main_3_20_09"); //Dopiero wtedy mo�esz stawi� czo�a mojemu Panu.
	
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
	description 	= "Gdzie znajd� twego pana?";
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
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_00"); //Gdzie znajd� twego pana?
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_01"); //Jego skarbiec znajduje si� w kamiennym Dworze Irdorath. Tam go szukaj.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_02"); //P�ki nie uda mu si� przywr�ci� w�a�ciwego porz�dku �wiata, b�dzie tam spoczywa�, pogr��ony w zadumie...
	AI_Output			(other, self, "DIA_DragonTalk_Main_4_15_03"); //Daruj sobie szczeg�y. Powiedz mi lepiej, gdzie si� znajduje ten Dw�r Irdorath.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_04"); //Ha, ha, ha. Rozczarowa�e� mnie, cz�owieczku. Przezwyci�y�e� tyle przeciwno�ci i pokona�e� niemal wszystkich z nas, a teraz o�mieszasz si� w�asn� niewiedz�.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_05"); //Je�li nazwa Irdorath nic ci nie m�wi, lepiej udaj si� do swoich mag�w i popro�, by pozwolili ci sobie us�ugiwa�.
	AI_Output			(self, other, "DIA_DragonTalk_Main_4_20_06"); //Bo najwyra�niej nie jeste� jeszcze got�w, by d�wiga� brzemi� prawdziwej wiedzy.
	 
	Log_CreateTopic (TOPIC_BuchHallenVonIrdorath, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BuchHallenVonIrdorath, LOG_RUNNING);
	B_LogEntry (TOPIC_BuchHallenVonIrdorath,"W�adca smok�w skry� si� podobno w pot�nym i �wi�tym Dworze Irdorath. To brzmi jako� znajomo. Gdzie to ja mog�em o tym czyta�?"); 

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













