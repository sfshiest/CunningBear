public class StringArrayTest {
    
    
    
    public Static List<String> generateStringArray (Integer rank) {
        List<String> l = new List<String> ();
        String rankedtest = 'Test ';
        
        if (rank == NULL) { rank = 0;}
        
        
        // Iterate over a list to read elements
        for(Integer i=0;i<rank;i++) {
            l.add(rankedtest + i);
            System.debug(l[i]);
        }
        
        
        return l;
        
    }
    
}