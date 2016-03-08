xquery version "1.0";
declare option saxon:output "omit-xml-declaration=yes";

<CATALOG>
	{ for $c in distinct-values(doc("plant_catalog.xml")//LIGHT) return 
	<LIGHT>
		<EXPOSURE>{data($c)}</EXPOSURE>
		{for $p in doc("plant_catalog.xml")//PLANT
		where $p/LIGHT = $c
		return
		<PLANT>
			{$p/COMMON}
			{$p/BOTANICAL}
			{$p/ZONE}
			{$p/PRICE}
			{$p/AVAILABILITY}
			<FAMILY>
				{data(doc("plant_families.xml")//SPECIES[.=$c/BOTANICAL]/../NAME)}
			</FAMILY>
		</PLANT>
		}
	</LIGHT>	
	}
</CATALOG>	